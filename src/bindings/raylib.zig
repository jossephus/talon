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

    wren.wrenSetSlotBool(vm, 0, r.IsKeyDown(@as(u8, @intFromFloat(key_code))));
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
        std.debug.print("{s}", .{path});

        wren.wrenEnsureSlots(vm, 1);
        wren.wrenGetVariable(vm, "raylib", "Texture2D", 0);

        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

        const render_texture_ptr: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
        render_texture_ptr.* = r.LoadTexture(path);
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
};
