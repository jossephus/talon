const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});
const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

pub const RaylibBindings = @This();

pub fn wren_raylib_init_window(vm: ?*wren.WrenVM) callconv(.C) void {
    const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const height: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const title = wren.wrenGetSlotString(vm, 3);
    r.SetConfigFlags(r.FLAG_VSYNC_HINT | r.FLAG_WINDOW_RESIZABLE);

    r.InitWindow(width, height, title);
}

pub fn wren_raylib_set_target_fps(vm: ?*wren.WrenVM) callconv(.C) void {
    const fps: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    std.debug.print("{d}", .{fps});
    r.SetTargetFPS(fps);
}

pub fn wren_raylib_window_should_close(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotBool(vm, 0, r.WindowShouldClose());
}

pub fn wren_raylib_begin_drawing(_: ?*wren.WrenVM) callconv(.C) void {
    r.BeginDrawing();
}

pub fn wren_raylib_clear_background(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const color_ptr: ?*r.Color = @alignCast(@ptrCast(foreign));

    r.ClearBackground(color_ptr.?.*);
}

pub fn wren_raylib_draw_text(vm: ?*wren.WrenVM) callconv(.C) void {
    const title = wren.wrenGetSlotString(vm, 1);
    const x: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const y: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const z: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));

    const foreign = wren.wrenGetSlotForeign(vm, 5);
    const color_ptr: ?*r.Color = @alignCast(@ptrCast(foreign));

    r.DrawText(title, x, y, z, color_ptr.?.*);
}

pub fn wren_raylib_end_drawing(_: ?*wren.WrenVM) callconv(.C) void {
    r.EndDrawing();
}

pub fn wren_raylib_close_window(_: ?*wren.WrenVM) callconv(.C) void {
    r.CloseWindow();
}

pub fn wren_load_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const height: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));

    const target = r.LoadRenderTexture(width, height);

    wren.wrenEnsureSlots(vm, 1);
    wren.wrenGetVariable(vm, "raylib", "RenderTexture2D", 0);

    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));

    const render_texture_ptr: *r.RenderTexture2D = @alignCast(@ptrCast(foreign_ptr));
    render_texture_ptr.* = target;
}

pub fn wren_unload_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const render_texture_ptr: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign));

    r.UnloadRenderTexture(render_texture_ptr.?.*);
}

pub fn get_screen_width(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetScreenWidth())));
}

pub fn get_screen_height(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetScreenHeight())));
}

pub fn begin_texture_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const texture_ptr: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign));
    r.BeginTextureMode(texture_ptr.?.*);
}

pub fn end_texture_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    r.EndTextureMode();
}

pub fn begin_drawing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    r.BeginDrawing();
}

pub fn end_drawing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    r.EndDrawing();
}

pub fn get_frame_time(vm: ?*wren.WrenVM) callconv(.C) void {
    const dt = r.GetFrameTime();
    wren.wrenSetSlotDouble(vm, 0, dt);
}

pub fn check_collission_recs(vm: ?*wren.WrenVM) callconv(.C) void {
    var foreign = wren.wrenGetSlotForeign(vm, 1);
    const rec1: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

    foreign = wren.wrenGetSlotForeign(vm, 2);
    const rec2: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionRecs(rec1.?.*, rec2.?.*));
}

pub fn is_key_down(vm: ?*wren.WrenVM) callconv(.C) void {
    const key_code = wren.wrenGetSlotDouble(vm, 1);

    wren.wrenSetSlotBool(vm, 0, r.IsKeyDown(@as(u16, @intFromFloat(key_code))));
}

pub fn draw_texture_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    var foreign = wren.wrenGetSlotForeign(vm, 1);
    const texture: ?*r.Texture2D = @alignCast(@ptrCast(foreign));

    foreign = wren.wrenGetSlotForeign(vm, 2);
    const source: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

    foreign = wren.wrenGetSlotForeign(vm, 3);
    const dest: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

    foreign = wren.wrenGetSlotForeign(vm, 4);
    const origin: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

    const rotation = wren.wrenGetSlotDouble(vm, 5);

    foreign = wren.wrenGetSlotForeign(vm, 6);
    const color: ?*r.Color = @alignCast(@ptrCast(foreign));

    _ = .{ source, dest, origin, rotation, color };

    r.DrawTexturePro(
        texture.?.*,
        source.?.*,
        dest.?.*,
        origin.?.*,
        @floatCast(rotation),
        color.?.*,
    );
}
pub const RenderTexture2D = struct {
    pub fn texture(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const render_texture_2d_ptr: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign));

        wren.wrenEnsureSlots(vm, 1);
        wren.wrenGetVariable(vm, "raylib", "Texture2D", 0);

        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

        const tx: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
        tx.* = render_texture_2d_ptr.?.*.texture;
    }
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));
        _ = foreign_ptr;
    }
};

pub const Texture2D = struct {
    pub fn width(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const render_texture_2d_ptr: ?*r.Texture2D = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(render_texture_2d_ptr.?.*.width)));
    }

    pub fn height(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const render_texture_2d_ptr: ?*r.Texture2D = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(render_texture_2d_ptr.?.*.height)));
    }

    pub fn unloadTexture(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const render_texture_2d_ptr: ?*r.Texture2D = @alignCast(@ptrCast(foreign));

        const texture = render_texture_2d_ptr.?.*;
        r.UnloadTexture(texture);
    }

    pub fn loadTexture(vm: ?*wren.WrenVM) callconv(.C) void {
        const path = wren.wrenGetSlotString(vm, 1);

        wren.wrenEnsureSlots(vm, 1);
        wren.wrenGetVariable(vm, "raylib", "Texture2D", 0);

        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

        const render_texture_ptr: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
        render_texture_ptr.* = r.LoadTexture(path);
    }
};

pub const Color = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
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

    pub fn finalize_color(data: ?*anyopaque) callconv(.c) void {
        _ = .{data};
    }
};

pub const Camera2D = struct {
    pub fn beginMode2D(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const camera_2d_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        const camera_2d = camera_2d_ptr.?.*;
        r.BeginMode2D(camera_2d);
    }

    pub fn endMode2D(vm: ?*wren.WrenVM) callconv(.C) void {
        _ = vm;

        r.EndMode2D();
    }
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
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
};

pub const Rectangle = struct {
    pub fn draw_rectangle_rec(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        const color_foreign = wren.wrenGetSlotForeign(vm, 1);
        const color_ptr: ?*r.Color = @alignCast(@ptrCast(color_foreign));

        r.DrawRectangleRec(
            rectangle_ptr.?.*,
            color_ptr.?.*,
        );
    }

    pub fn get_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.x));
    }

    pub fn set_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        const x = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.x = @floatCast(x);
    }

    pub fn get_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.y));
    }

    pub fn set_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        const y = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.y = @floatCast(y);
    }

    pub fn get_width(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.width));
    }

    pub fn set_width(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        const width = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.width = @floatCast(width);
    }

    pub fn get_height(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.height));
    }

    pub fn set_height(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Rectangle = @alignCast(@ptrCast(foreign));

        const height = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.x = @floatCast(height);
    }

    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
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
};

pub const Vector2 = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

        const x = wren.wrenGetSlotDouble(vm, 1);
        const y = wren.wrenGetSlotDouble(vm, 2);

        const vector_ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
        vector_ptr.* = .{
            .x = @floatCast(x),
            .y = @floatCast(y),
        };
    }

    pub fn get_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, vector.?.*.x));
    }

    pub fn set_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

        const x = wren.wrenGetSlotDouble(vm, 1);

        vector.?.*.x = @floatCast(x);
    }

    pub fn get_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, vector_ptr.?.*.y));
    }

    pub fn set_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

        const y = wren.wrenGetSlotDouble(vm, 1);

        vector_ptr.?.*.y = @floatCast(y);
    }
};
