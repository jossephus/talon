const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});
const builtin = @import("builtin");
const RaylibBindings = @import("bindings/raylib.zig");

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
const allocator = debug_allocator.allocator();

pub const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

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

fn wren_raylib_clear_background(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const color_ptr: ?*r.Color = @alignCast(@ptrCast(foreign));

    r.ClearBackground(color_ptr.?.*);
}

fn wren_raylib_draw_text(vm: ?*wren.WrenVM) callconv(.C) void {
    const title = wren.wrenGetSlotString(vm, 1);
    const x: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const y: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const z: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));

    const foreign = wren.wrenGetSlotForeign(vm, 5);
    const color_ptr: ?*r.Color = @alignCast(@ptrCast(foreign));

    r.DrawText(title, x, y, z, color_ptr.?.*);
}

fn wren_raylib_end_drawing(_: ?*wren.WrenVM) callconv(.C) void {
    r.EndDrawing();
}

fn wren_raylib_close_window(_: ?*wren.WrenVM) callconv(.C) void {
    r.CloseWindow();
}

fn wren_load_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const height: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));

    const target = r.LoadRenderTexture(width, height);

    wren.wrenEnsureSlots(vm, 1);
    wren.wrenGetVariable(vm, "raylib", "RenderTexture2D", 0);

    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));

    const render_texture_ptr: *r.RenderTexture2D = @alignCast(@ptrCast(foreign_ptr));
    render_texture_ptr.* = target;
}

fn wren_unload_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const render_texture_ptr: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign));

    r.UnloadRenderTexture(render_texture_ptr.?.*);
}

fn loadModuleComplete(vm: ?*wren.WrenVM, name: [*c]const u8, result: wren.WrenLoadModuleResult) callconv(.c) void {
    _ = .{ vm, name };
    if (result.source == null) return;
}

fn loadBuiltinModule(name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
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

fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    _ = .{ vm, name };
    const mod = std.mem.span(name);
    std.debug.print("Source is {s}", .{name});

    if (!std.fs.path.isAbsolute(mod) and !isRelative(mod)) {
        return loadBuiltinModule(name);
    }

    const path = std.mem.concat(allocator, u8, &[_][]const u8{ std.mem.span(name), ".wren" }) catch return .{
        .source = null,
        .onComplete = null,
    };

    defer allocator.free(path);

    var file: std.fs.File = undefined;
    if (isRelative(mod)) {
        file = std.fs.cwd().openFile(path, .{}) catch |err| {
            std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), path });
            return .{
                .source = null,
                .onComplete = null,
            };
        };
    } else {
        std.debug.print("Path is '{s}'\n", .{path});
        file = std.fs.openFileAbsolute(path, .{ .mode = .read_write }) catch |err| {
            std.log.err("Failed to open file: {s} {s}\n", .{ path, @errorName(err) });
            return .{
                .source = null,
                .onComplete = null,
            };
        };
    }

    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [2048]u8 = undefined;

    const read = in_stream.readAll(&script) catch {
        return .{
            .source = null,
            .onComplete = null,
        };
    };
    script[read] = 0;

    const source = allocator.dupeZ(u8, &script) catch return .{
        .source = null,
        .onComplete = null,
    };

    return .{
        .source = source,
        .onComplete = loadModuleComplete,
    };
}

fn isRelative(path: []const u8) bool {
    if (path.len < 2) {
        return false;
    }

    if (path[0] == '.' and std.fs.path.isSep(path[1])) {
        return true;
    }

    if (path[0] == '.' and path[1] == '.' and std.fs.path.isSep(path[1])) {
        return true;
    }

    return false;
}

fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.C) ?[*:0]const u8 {
    _ = .{ vm, importer, module };

    // Return a null-terminated string
    return "./game";
}

fn allocate_color(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const red = wren.wrenGetSlotDouble(vm, 1);
    const green = wren.wrenGetSlotDouble(vm, 2);
    const blue = wren.wrenGetSlotDouble(vm, 3);
    const a = wren.wrenGetSlotDouble(vm, 4);

    const color_ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    color_ptr.* = .{
        .r = @as(u8, @intFromFloat(red)),
        .g = @as(u8, @intFromFloat(green)),
        .b = @as(u8, @intFromFloat(blue)),
        .a = @as(u8, @intFromFloat(a)),
    };
}

fn allocate_rectangle(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Rectangle));

    const x = wren.wrenGetSlotDouble(vm, 1);
    const y = wren.wrenGetSlotDouble(vm, 2);
    const width = wren.wrenGetSlotDouble(vm, 3);
    const height = wren.wrenGetSlotDouble(vm, 4);

    const rectangle_ptr: *r.Rectangle = @alignCast(@ptrCast(foreign_ptr));
    rectangle_ptr.* = .{
        .x = @floatCast(x),
        .y = @floatCast(y),
        .width = @floatCast(width),
        .height = @floatCast(height),
    };
}

fn allocate_vector2(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const x = wren.wrenGetSlotDouble(vm, 1);
    const y = wren.wrenGetSlotDouble(vm, 2);

    const vector_ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    vector_ptr.* = .{
        .x = @floatCast(x),
        .y = @floatCast(y),
    };
}

fn allocate_camera_2d(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Camera2D));

    var foreign = wren.wrenGetSlotForeign(vm, 1);
    const offset: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

    foreign = wren.wrenGetSlotForeign(vm, 2);
    const target: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

    const y = wren.wrenGetSlotDouble(vm, 3);
    const x = wren.wrenGetSlotDouble(vm, 4);

    const camera_ptr: *r.Camera2D = @alignCast(@ptrCast(foreign_ptr));
    camera_ptr.* = .{
        .offset = offset.?.*,
        .target = target.?.*,
        .rotation = @floatCast(x),
        .zoom = @floatCast(y),
    };
}

fn allocate_render_texture(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));
    _ = foreign_ptr;
}

fn allocate_render_texture_2d(vm: ?*wren.WrenVM) callconv(.c) void {
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));
    _ = foreign_ptr;
}

fn finalize_color(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn finalize_render_texture(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn finalize_render_texture_2d(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn finalize_rectangle(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn finalize_vector2(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn finalize_camera_2d(data: ?*anyopaque) callconv(.c) void {
    _ = .{data};
}

fn bindForiegnClass(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8) callconv(.c) wren.WrenForeignClassMethods {
    _ = .{ vm, module, className };
    var methods: wren.WrenForeignClassMethods = .{
        .allocate = null,
        .finalize = null,
    };

    if (std.mem.eql(u8, "Color", std.mem.span(className))) {
        methods.allocate = allocate_color;
        methods.finalize = finalize_color;
        return methods;
    }

    if (std.mem.eql(u8, "RenderTexture2D", std.mem.span(className))) {
        methods.allocate = allocate_render_texture;
        methods.finalize = finalize_render_texture;
    }

    if (std.mem.eql(u8, "Texture2D", std.mem.span(className))) {
        methods.allocate = allocate_render_texture_2d;
        methods.finalize = finalize_render_texture_2d;
    }

    if (std.mem.eql(u8, "Rectangle", std.mem.span(className))) {
        methods.allocate = allocate_rectangle;
        methods.finalize = finalize_rectangle;
    }

    if (std.mem.eql(u8, "Vector2", std.mem.span(className))) {
        methods.allocate = allocate_vector2;
        methods.finalize = finalize_vector2;
    }

    if (std.mem.eql(u8, "Camera2D", std.mem.span(className))) {
        methods.allocate = allocate_camera_2d;
        methods.finalize = finalize_camera_2d;
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
            } else if (std.mem.eql(u8, std.mem.span(signature), "clearBackground(_)")) {
                return wren_raylib_clear_background;
            } else if (std.mem.eql(u8, std.mem.span(signature), "drawText(_,_,_,_,_)")) {
                return wren_raylib_draw_text;
            } else if (std.mem.eql(u8, std.mem.span(signature), "endDrawing()")) {
                return wren_raylib_end_drawing;
            } else if (std.mem.eql(u8, std.mem.span(signature), "closeWindow()")) {
                return wren_raylib_close_window;
            } else if (std.mem.eql(u8, std.mem.span(signature), "loadRenderTexture(_,_)")) {
                return wren_load_render_texture;
            } else if (std.mem.eql(u8, std.mem.span(signature), "unloadRenderTexture(_)")) {
                return wren_unload_render_texture;
            } else if (std.mem.eql(u8, std.mem.span(signature), "getScreenWidth()")) {
                return RaylibBindings.get_screen_width;
            } else if (std.mem.eql(u8, std.mem.span(signature), "getScreenHeight()")) {
                return RaylibBindings.get_screen_height;
            } else if (std.mem.eql(u8, std.mem.span(signature), "beginTextureMode(_)")) {
                return RaylibBindings.begin_texture_mode;
            } else if (std.mem.eql(u8, std.mem.span(signature), "endTextureMode(_)")) {
                return RaylibBindings.end_texture_mode;
            } else if (std.mem.eql(u8, std.mem.span(signature), "drawTexturePro(_,_,_,_,_,_)")) {
                return RaylibBindings.draw_texture_pro;
            } else if (std.mem.eql(u8, std.mem.span(signature), "getFrameTime()")) {
                return RaylibBindings.get_frame_time;
            } else if (std.mem.eql(u8, std.mem.span(signature), "checkCollisionRecs(_,_)")) {
                return RaylibBindings.check_collission_recs;
            } else if (std.mem.eql(u8, std.mem.span(signature), "isKeyDown(_)")) {
                return RaylibBindings.is_key_down;
            } else {
                return wren_plusone;
            }
        }
        if (std.mem.eql(u8, "Color", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "write(_)")) {
                return wren_file_write;
            } else if (std.mem.eql(u8, std.mem.span(signature), "close()")) {
                return wren_file_close;
            }
        }

        if (std.mem.eql(u8, "RenderTexture2D", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "texture")) {
                return RaylibBindings.RenderTexture2D.texture;
            }
        }

        if (std.mem.eql(u8, "Rectangle", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "drawRectangleRec(_)")) {
                return RaylibBindings.Rectangle.draw_rectangle_rec;
            }
        }

        if (std.mem.eql(u8, "Texture2D", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "width")) {
                return RaylibBindings.Texture2D.width;
            }

            if (std.mem.eql(u8, std.mem.span(signature), "height")) {
                return RaylibBindings.Texture2D.height;
            }

            if (std.mem.eql(u8, std.mem.span(signature), "unloadTexture()")) {
                return RaylibBindings.Texture2D.unloadTexture;
            }

            if (std.mem.eql(u8, std.mem.span(signature), "loadTexture(_)")) {
                return RaylibBindings.Texture2D.loadTexture;
            }
        }

        if (std.mem.eql(u8, "Camera2D", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "beginMode2D()")) {
                return RaylibBindings.Camera2D.beginMode2D;
            }

            if (std.mem.eql(u8, std.mem.span(signature), "endMode2D()")) {
                return RaylibBindings.Camera2D.endMode2D;
            }
        }
    }
    return null;
}

pub fn main() !void {
    //const script = @embedFile("main.wren");

    defer {
        _ = debug_allocator.deinit();
    }

    errdefer |err| {
        std.debug.print("Error: {s}\n", .{@errorName(err)});
    }

    const args = std.process.argsAlloc(allocator) catch unreachable;
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        @panic("We require a wren script to run");
    }
    const module: [*:0]const u8 = args[1];
    //const script = args[1];

    const file = std.fs.cwd().openFile(args[1], .{}) catch |err| {
        std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), args[1] });
        return;
    };
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [2048]u8 = undefined;

    const read = try in_stream.readAll(&script);
    script[read] = 0;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = writeFn;
    config.errorFn = errorFn;

    config.bindForeignClassFn = bindForiegnClass;
    config.bindForeignMethodFn = bindForeignMethod;

    config.resolveModuleFn = resolveModule;
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
