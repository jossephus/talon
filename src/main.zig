const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
});
const builtin = @import("builtin");

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;

pub const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

const io = @embedFile("io.wren");
const raylib = @embedFile("raylib.wren");

fn writeFn(vm: ?*wren.WrenVM, text: [*c]const u8) callconv(.C) void {
    _ = vm;
    std.debug.print("{s}", .{text});
}

fn errorFn(
    vm: ?*wren.WrenVM,
    errorType: wren.WrenErrorType,
    module: [*c]const u8,
    line: c_int,
    msg: [*c]const u8,
) callconv(.C) void {
    _ = vm;
    switch (errorType) {
        wren.WREN_ERROR_COMPILE => {
            std.debug.print("[{s} line {d}] [Error] {s}\n", .{ module, line, msg });
        },
        wren.WREN_ERROR_STACK_TRACE => {
            std.debug.print("[{s} line {d}] in {s}\n", .{ module, line, msg });
        },
        wren.WREN_ERROR_RUNTIME => {
            std.debug.print("[Runtime Error] {s}\n", .{msg});
        },
        else => {},
    }
}

const count = 0;

const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;

const ForeignMethodEntry = struct {
    signature: []const u8,
    func: WrenForeignMethodFn,
};

const ClassMethods = struct {
    class_name: []const u8,
    methods: []const ForeignMethodEntry,
};

const ModuleMethods = struct {
    module_name: []const u8,
    classes: []const ClassMethods,
};

fn wren_count(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, count);
}

fn wren_delete(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, count);
}

fn wren_plusone(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, wren.wrenGetSlotDouble(vm, 1) + 1);
}

fn wren_file_write(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    std.debug.print("I am writing ", .{});
}

fn wren_file_close(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    std.debug.print("I am closing ", .{});
}

fn wren_raylib_init_window(vm: ?*wren.WrenVM) callconv(.C) void {
    const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const height: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const title = wren.wrenGetSlotString(vm, 3);
    r.SetConfigFlags(r.FLAG_VSYNC_HINT | r.FLAG_WINDOW_RESIZABLE);
    std.debug.print("Width {d}\n", .{width});
    std.debug.print("Height {d}\n", .{height});
    std.debug.print("TItle {s}\n", .{title});

    r.InitWindow(width, height, title);
}

fn wren_raylib_set_target_fps(vm: ?*wren.WrenVM) callconv(.C) void {
    const fps: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    std.debug.print("{d}", .{fps});
    r.SetTargetFPS(fps);
}

fn wren_raylib_window_should_close(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotBool(vm, 0, r.WindowShouldClose());
}

fn wren_raylib_begin_drawing(_: ?*wren.WrenVM) callconv(.C) void {
    r.BeginDrawing();
}

fn wren_raylib_clear_background(_: ?*wren.WrenVM) callconv(.C) void {
    r.ClearBackground(r.RAYWHITE);
}

fn wren_raylib_draw_text(vm: ?*wren.WrenVM) callconv(.C) void {
    const title = wren.wrenGetSlotString(vm, 1);
    const x: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const y: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const z: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));

    r.DrawText(title, x, y, z, r.LIGHTGRAY);
}

fn wren_raylib_end_drawing(_: ?*wren.WrenVM) callconv(.C) void {
    r.EndDrawing();
}

fn wren_raylib_close_window(_: ?*wren.WrenVM) callconv(.C) void {
    r.CloseWindow();
}

fn loadModuleComplete(vm: ?*wren.WrenVM, name: [*c]const u8, result: wren.WrenLoadModuleResult) callconv(.c) void {
    _ = .{ vm, name };
    if (result.source == null) return;
}

fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    _ = .{ vm, name };
    if (std.mem.eql(u8, "io", std.mem.span(name))) {
        return .{
            .source = io,
            .onComplete = loadModuleComplete,
        };
    }

    if (std.mem.eql(u8, "raylib", std.mem.span(name))) {
        return .{
            .source = raylib,
            .onComplete = loadModuleComplete,
        };
    }

    return .{
        .source = null,
        .onComplete = null,
    };
}

fn allocate_color(vm: ?*wren.WrenVM) callconv(.c) void {
    _ = .{vm};
    std.debug.print("Am i being called 4\n", .{});
}

fn finalize_color(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn bindForiegnClass(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8) callconv(.c) wren.WrenForeignClassMethods {
    _ = .{ vm, module, className };
    var methods: wren.WrenForeignClassMethods = .{
        .allocate = null,
        .finalize = null,
    };

    if (std.mem.eql(u8, "File", std.mem.span(className))) {
        std.debug.print("{d}", .{wren.wrenGetSlotCount(vm)});
        methods.allocate = allocate_color;
        methods.finalize = finalize_color;
        return methods;
    }

    return methods;
}

fn bindForeignMethod(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8, isStatic: bool, signature: [*c]const u8) callconv(.c) ?*const WrenForeignMethodFn {
    _ = .{ vm, module, className, isStatic, signature };

    if (std.mem.eql(u8, "main", std.mem.span(module))) {
        if (std.mem.eql(u8, "FFI", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "count()")) {
                return wren_count;
            } else {
                return wren_plusone;
            }
        }
    }

    if (std.mem.eql(u8, "io", std.mem.span(module))) {
        if (std.mem.eql(u8, "Directory", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "delete()")) {
                return wren_delete;
            } else {
                return wren_plusone;
            }
        }
    }

    if (std.mem.eql(u8, "raylib", std.mem.span(module))) {
        if (std.mem.eql(u8, "Raylib", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "initWindow(_,_,_)")) {
                return wren_raylib_init_window;
            } else if (std.mem.eql(u8, std.mem.span(signature), "setTargetFPS(_)")) {
                return wren_raylib_set_target_fps;
            } else if (std.mem.eql(u8, std.mem.span(signature), "windowShouldClose()")) {
                return wren_raylib_window_should_close;
            } else if (std.mem.eql(u8, std.mem.span(signature), "beingDrawing()")) {
                return wren_raylib_begin_drawing;
            } else if (std.mem.eql(u8, std.mem.span(signature), "clearBackground()")) {
                return wren_raylib_clear_background;
            } else if (std.mem.eql(u8, std.mem.span(signature), "drawText(_,_,_,_)")) {
                return wren_raylib_draw_text;
            } else if (std.mem.eql(u8, std.mem.span(signature), "endDrawing()")) {
                return wren_raylib_end_drawing;
            } else if (std.mem.eql(u8, std.mem.span(signature), "closeWindow()")) {
                return wren_raylib_close_window;
            } else {
                return wren_plusone;
            }
        }
        if (std.mem.eql(u8, "File", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "write(_)")) {
                return wren_file_write;
            } else if (std.mem.eql(u8, std.mem.span(signature), "close()")) {
                return wren_file_close;
            }
        }
    }
    return null;
}

pub fn main() !void {
    const module: [*:0]const u8 = "main";
    //const script = @embedFile("main.wren");

    const wasm = builtin.target.cpu.arch.isWasm();

    const allocator, const is_debug = gpa: {
        if (wasm) break :gpa .{ std.heap.wasm_allocator, false };
        break :gpa switch (builtin.mode) {
            .Debug, .ReleaseSafe => .{ debug_allocator.allocator(), true },
            .ReleaseFast, .ReleaseSmall => .{ std.heap.smp_allocator, false },
        };
    };

    defer if (is_debug) {
        _ = debug_allocator.deinit();
    };

    const args = std.process.argsAlloc(allocator) catch unreachable;
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        @panic("We require a wren script to run");
    }
    //const script = args[1];

    const file = std.fs.cwd().openFile(args[1], .{}) catch |err| {
        std.log.err("Failed to open file: {s}", .{@errorName(err)});
        return;
    };
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [1024]u8 = undefined;

    const read = try in_stream.readAll(&script);
    script[read] = 0;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = writeFn;
    config.errorFn = errorFn;

    config.bindForeignClassFn = bindForiegnClass;
    config.bindForeignMethodFn = bindForeignMethod;

    config.loadModuleFn = loadModule;

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
