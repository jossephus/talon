const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});
const RaylibBindings = @import("raylib.zig");
const MathBindings = @import("math.zig");

pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;

pub const ForeignMethodBindings = std.StaticStringMap(?*const WrenForeignMethodFn).initComptime(.{
    .{ "raylib.Raylib.initWindow(_,_,_)", RaylibBindings.wren_raylib_init_window },
    .{ "raylib.Raylib.setTargetFPS(_)", RaylibBindings.wren_raylib_set_target_fps },
    .{ "raylib.Raylib.windowShouldClose()", RaylibBindings.wren_raylib_window_should_close },
    .{ "raylib.Raylib.beginDrawing()", RaylibBindings.wren_raylib_begin_drawing },
    .{ "raylib.Raylib.clearBackground(_)", RaylibBindings.wren_raylib_clear_background },
    .{ "raylib.Raylib.drawText(_,_,_,_,_)", RaylibBindings.wren_raylib_draw_text },
    .{ "raylib.Raylib.endDrawing()", RaylibBindings.wren_raylib_end_drawing },
    .{ "raylib.Raylib.closeWindow()", RaylibBindings.wren_raylib_close_window },
    .{ "raylib.Raylib.loadRenderTexture(_,_)", RaylibBindings.wren_load_render_texture },
    .{ "raylib.Raylib.unloadRenderTexture(_)", RaylibBindings.wren_unload_render_texture },
    .{ "raylib.Raylib.getScreenWidth()", RaylibBindings.get_screen_width },
    .{ "raylib.Raylib.getScreenHeight()", RaylibBindings.get_screen_height },
    .{ "raylib.Raylib.beginTextureMode(_)", RaylibBindings.begin_texture_mode },
    .{ "raylib.Raylib.endTextureMode(_)", RaylibBindings.end_texture_mode },
    .{ "raylib.Raylib.drawTexturePro(_,_,_,_,_,_)", RaylibBindings.draw_texture_pro },
    .{ "raylib.Raylib.getFrameTime()", RaylibBindings.get_frame_time },
    .{ "raylib.Raylib.checkCollisionRecs(_,_)", RaylibBindings.check_collission_recs },
    .{ "raylib.Raylib.isKeyDown(_)", RaylibBindings.is_key_down },
    .{ "raylib.RenderTexture2D.texture", RaylibBindings.RenderTexture2D.texture },
    .{ "raylib.Texture2D.width", RaylibBindings.Texture2D.width },
    .{ "raylib.Texture2D.height", RaylibBindings.Texture2D.height },
    .{ "raylib.Texture2D.unloadTexture()", RaylibBindings.Texture2D.unloadTexture },
    .{ "raylib.Texture2D.loadTexture(_)", RaylibBindings.Texture2D.loadTexture },
    .{ "raylib.Camera2D.beginMode2D()", RaylibBindings.Camera2D.beginMode2D },
    .{ "raylib.Camera2D.endMode2D()", RaylibBindings.Camera2D.endMode2D },
    .{ "raylib.Rectangle.drawRectangleRec(_)", RaylibBindings.Rectangle.draw_rectangle_rec },
    .{ "raylib.Rectangle.x", RaylibBindings.Rectangle.get_x },
    .{ "raylib.Rectangle.x=(_)", RaylibBindings.Rectangle.set_x },
    .{ "raylib.Rectangle.y", RaylibBindings.Rectangle.get_y },
    .{ "raylib.Rectangle.y=(_)", RaylibBindings.Rectangle.set_y },
    .{ "raylib.Rectangle.width", RaylibBindings.Rectangle.get_width },
    .{ "raylib.Rectangle.width=(_)", RaylibBindings.Rectangle.set_width },
    .{ "raylib.Rectangle.height", RaylibBindings.Rectangle.get_height },
    .{ "raylib.Rectangle.height=(_)", RaylibBindings.Rectangle.set_height },
    .{ "raylib.Vector2.x", RaylibBindings.Vector2.get_x },
    .{ "raylib.Vector2.x=(_)", RaylibBindings.Vector2.set_x },
    .{ "raylib.Vector2.y", RaylibBindings.Vector2.get_y },
    .{ "raylib.Vector2.y=(_)", RaylibBindings.Vector2.set_y },
    .{ "math.Math.min(_,_)", MathBindings.min },
    .{ "math.Math.max(_,_)", MathBindings.max },
    .{ "math.Math.sin(_)", MathBindings.sin },
    .{ "math.Math.cos(_)", MathBindings.cos },
    .{ "math.Math.pow(_,_)", MathBindings.pow },
});

pub const WrenForeignClassAllocatorFn = fn (?*wren.WrenVM) callconv(.c) void;

pub const ForeignClass = struct { allocate: ?*const WrenForeignClassAllocatorFn };

pub const ForeignClassBindings = std.StaticStringMap(ForeignClass).initComptime(.{
    .{ "raylib.Color", ForeignClass{ .allocate = RaylibBindings.Color.allocate } },
    .{ "raylib.RenderTexture2D", ForeignClass{ .allocate = RaylibBindings.RenderTexture2D.allocate } },
    .{ "raylib.Camera2D", ForeignClass{ .allocate = RaylibBindings.Camera2D.allocate } },
    .{ "raylib.Vector2", ForeignClass{ .allocate = RaylibBindings.Vector2.allocate } },
    .{ "raylib.Rectangle", ForeignClass{ .allocate = RaylibBindings.Rectangle.allocate } },
});
