const std = @import("std");
const builtin = @import("builtin");
const common = @import("common.zig");
const hot = @import("watcher/hot.zig");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});

pub const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

const Bindings = @import("bindings/index.zig");

var produce_executable = true;

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
pub const allocator = if (builtin.target.cpu.arch.isWasm()) std.heap.wasm_allocator else debug_allocator.allocator();

const Command = enum {
    @"--hot",
};

pub fn main() !void {
    const args = std.process.argsAlloc(allocator) catch unreachable;
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        @panic("We require a wren script to run");
    } else if (args.len == 2) {
        try runProgram(args[1]);
        return;
    }

    const command = std.meta.stringToEnum(Command, args[1]) orelse {
        std.log.err("Invalid command: {s}\n", .{args[1]});
        return;
    };

    switch (command) {
        .@"--hot" => {
            try hot.hot(allocator, args[2]);
        },
    }
}

pub fn runProgram(path: []const u8) !void {
    const module: [*:0]const u8 = @ptrCast(path);

    //var buf: [std.fs.max_path_bytes]u8 = undefined;
    //const rel_path = try std.fs.cwd().realpath(".", &buf);

    //const child_rel_path = try std.fs.path.join(allocator, &.{rel_path});
    //std.debug.print("Absolute path: {s}\n", .{child_rel_path});

    const file = std.fs.cwd().openFile(path, .{}) catch |err| {
        std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), path });
        return;
    };
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [std.fs.max_path_bytes]u8 = undefined;

    const read = try in_stream.readAll(&script);
    script[read] = 0;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = common.writeFn;
    config.errorFn = common.errorFn;

    config.bindForeignClassFn = common.bindForiegnClass;
    config.bindForeignMethodFn = common.bindForeignMethod;

    config.resolveModuleFn = if (produce_executable) @import("./resolve_module.zig").resolveModule else common.resolveModule;
    config.loadModuleFn = common.loadModule;

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const source_code: [*c]const u8 = @ptrCast(&script);

    const result = wren.wrenInterpret(vm, module, source_code);

    switch (result) {
        wren.WREN_RESULT_COMPILE_ERROR => {
            std.debug.print("Compile Error!\n", .{});
        },
        wren.WREN_RESULT_RUNTIME_ERROR => {
            std.debug.print("Runtime Error!\n", .{});
        },
        wren.WREN_RESULT_SUCCESS => {
            std.debug.print("Success!\n", .{});
        },
        else => {},
    }
}

pub fn runProgramHot(path: []const u8, stop_signal: *std.atomic.Value(bool)) !void {
    if (stop_signal.load(.acquire)) {
        std.log.info("Stop signal received, exiting program.", .{});
        return; // Gracefully exit the function, and thus the thread.
    }

    const module: [*:0]const u8 = @ptrCast(path);

    //var buf: [std.fs.max_path_bytes]u8 = undefined;
    //const rel_path = try std.fs.cwd().realpath(".", &buf);

    //const child_rel_path = try std.fs.path.join(allocator, &.{rel_path});
    //std.debug.print("Absolute path: {s}\n", .{child_rel_path});

    const file = std.fs.cwd().openFile(path, .{}) catch |err| {
        std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), path });
        return;
    };
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [std.fs.max_path_bytes]u8 = undefined;

    const read = try in_stream.readAll(&script);
    script[read] = 0;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = common.writeFn;
    config.errorFn = common.errorFn;

    config.bindForeignClassFn = common.bindForiegnClass;
    config.bindForeignMethodFn = common.bindForeignMethod;

    var context = hot.VmContext{
        .stop_signal = stop_signal,
    };

    config.resolveModuleFn = if (produce_executable) @import("./resolve_module.zig").resolveModule else common.resolveModule;
    config.loadModuleFn = common.loadModule;
    config.userData = @as(*anyopaque, &context);

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const source_code: [*c]const u8 = @ptrCast(&script);

    const result = wren.wrenInterpret(vm, module, source_code);

    switch (result) {
        wren.WREN_RESULT_COMPILE_ERROR => {
            std.debug.print("Compile Error!\n", .{});
        },
        wren.WREN_RESULT_RUNTIME_ERROR => {
            std.debug.print("Runtime Error!\n", .{});
        },
        wren.WREN_RESULT_SUCCESS => {
            //std.debug.print("Success!\n", .{});
        },
        else => {},
    }
}
