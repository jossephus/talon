const std = @import("std");
const ws = @import("websocket.zig");
const Channel = @import("channel.zig").Channel;
const builtin = @import("builtin");
const Watcher = switch (builtin.target.os.tag) {
    .linux => @import("LinuxWatcher.zig"),
    .macos => @import("MacosWatcher.zig"),
    .windows => @import("WindowsWatcher.zig"),
    else => @compileError("unsupported platform"),
};
const runProgramHot = @import("../main.zig").runProgramHot;
pub var stop_signal = std.atomic.Value(bool).init(false);
var program_thread: ?std.Thread = null;

pub const ServeEvent = union(enum) {
    change,
    connect: ws.Connection,
    disconnect: ws.Connection,
};

const RunContext = struct {
    gpa: std.mem.Allocator,
    path: []const u8,
};

pub const VmContext = struct {
    stop_signal: *std.atomic.Value(bool),
};

fn runProgramThreadFn(context: RunContext) !void {
    // It's now the responsibility of `runProgram` to accept this
    // stop_signal and check it periodically inside its own loops.
    try runProgramHot(context.path, &stop_signal);
}

fn startProgramThread(gpa: std.mem.Allocator, path: []const u8) !void {
    // Ensure the signal is false before starting.
    stop_signal.store(false, .release);

    const context = RunContext{
        .gpa = gpa,
        .path = path,
    };

    // Spawn the new thread!
    program_thread = try std.Thread.spawn(.{}, runProgramThreadFn, .{context});
    std.log.info("Program thread started.", .{});
}

pub fn hot(gpa: std.mem.Allocator, path: []const u8) !void {
    std.log.info("hot {s}", .{path});

    var buf: [64]ServeEvent = undefined;
    var channel: Channel(ServeEvent) = .init(&buf);

    var debouncer: Debouncer = .{
        .cascade_window_ms = 25,
        .channel = &channel,
    };
    debouncer.start() catch |err| {
        std.log.err(
            "error: unable to start debouncer: {s}",
            .{@errorName(err)},
        );
        return;
    };

    var dirs_to_watch: std.ArrayListUnmanaged([:0]const u8) = .empty;
    defer if (builtin.mode == .Debug) dirs_to_watch.deinit(gpa);

    try dirs_to_watch.append(gpa, try std.fmt.allocPrintZ(gpa, "{s}", .{"."}));

    var dir = try std.fs.cwd().openDir(".", .{ .iterate = true });
    defer dir.close();

    var it = dir.iterate();
    while (try it.next()) |entry| {
        if (entry.kind == .directory) {
            // entry.name is the relative path for the subdirectory
            try dirs_to_watch.append(gpa, try std.fmt.allocPrintZ(gpa, "{s}", .{entry.name}));
        }
    }

    var watcher: Watcher = try .init(
        gpa,
        &debouncer,
        dirs_to_watch.items,
    );

    watcher.start() catch |err| {
        std.log.err(
            "error: unable to start file watcher: {s}",
            .{@errorName(err)},
        );
        return;
    };

    var build_lock: std.Thread.RwLock = .{};

    //    try runProgram(path);

    try startProgramThread(gpa, path);

    var websockets: std.AutoArrayHashMapUnmanaged(
        std.posix.socket_t,
        ws.Connection,
    ) = .empty;

    while (true) {
        const event = channel.get();
        std.log.debug("new event: {s}", .{@tagName(event)});
        switch (event) {
            .change => {
                build_lock.lock();
                // try runProgram(path);

                stop_signal.store(true, .release);

                if (program_thread) |thread| {
                    thread.join();
                    program_thread = null;
                }

                stop_signal.store(true, .release);

                try startProgramThread(gpa, path);

                build_lock.unlock();

                for (websockets.entries.items(.value)) |*conn| {
                    conn.writeMessage(
                        \\{ "command": "reload_all" }
                    , .text) catch |err| {
                        std.log.debug(
                            "error writing to ws: {s}",
                            .{@errorName(err)},
                        );
                    };
                }
            },
            .connect => |conn| {
                try websockets.put(gpa, conn.stream.handle, conn);
            },
            .disconnect => |conn| {
                // the server thread will take care of closing the connection
                // as the corresponding thread shuts down
                _ = websockets.swapRemove(conn.stream.handle);
            },
        }
    }

    // Debug print to check
    for (dirs_to_watch.items) |p| {
        std.debug.print("Watching: {s}\n", .{p});
    }
}

pub const Debouncer = struct {
    cascade_window_ms: i64,

    cascade_mutex: std.Thread.Mutex = .{},
    cascade_condition: std.Thread.Condition = .{},
    cascade_start_ms: i64 = 0,
    channel: *Channel(ServeEvent),

    /// Thread-safe. To be called when a new event comes in
    pub fn newEvent(d: *Debouncer) void {
        {
            d.cascade_mutex.lock();
            defer d.cascade_mutex.unlock();
            d.cascade_start_ms = std.time.milliTimestamp();
        }
        d.cascade_condition.signal();
    }

    pub fn start(d: *Debouncer) !void {
        const t = try std.Thread.spawn(.{}, Debouncer.notify, .{d});
        t.detach();
    }

    pub fn notify(d: *Debouncer) void {
        while (true) {
            d.cascade_mutex.lock();
            defer d.cascade_mutex.unlock();

            while (d.cascade_start_ms == 0) {
                // no active cascade
                d.cascade_condition.wait(&d.cascade_mutex);
            }
            // cascade != 0
            while (true) {
                const time_passed = std.time.milliTimestamp() - d.cascade_start_ms;
                if (time_passed >= d.cascade_window_ms) break;
                d.cascade_mutex.unlock();
                const sleep_ms = d.cascade_window_ms - time_passed;
                std.Thread.sleep(@intCast(sleep_ms * std.time.ns_per_ms));
                d.cascade_mutex.lock();
            }

            // We have slept enough, "commit" the cascade window and
            // trigger a new build.
            d.cascade_start_ms = 0;
            d.channel.put(.change);
        }
    }
};
