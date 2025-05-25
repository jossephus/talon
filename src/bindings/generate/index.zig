// Generated from generate.zig
// and updated to fix unhandled cases

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
const MathBindings = @import("../math.zig");

pub const RaylibBindings = @This();

pub fn wren_raylib_init_window(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotString(vm, 3);
    r.InitWindow(@"0", @"1", @"2");
}

pub fn wren_raylib_close_window(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.CloseWindow();
}

pub fn wren_raylib_window_should_close(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.WindowShouldClose());
}

pub fn wren_raylib_is_window_ready(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowReady());
}

pub fn wren_raylib_is_window_fullscreen(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowFullscreen());
}

pub fn wren_raylib_is_window_hidden(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowHidden());
}

pub fn wren_raylib_is_window_minimized(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowMinimized());
}

pub fn wren_raylib_is_window_maximized(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowMaximized());
}

pub fn wren_raylib_is_window_focused(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowFocused());
}

pub fn wren_raylib_is_window_resized(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsWindowResized());
}

pub fn wren_raylib_is_window_state(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsWindowState(@"0"));
}

pub fn wren_raylib_set_window_state(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetWindowState(@"0");
}

pub fn wren_raylib_clear_window_state(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.ClearWindowState(@"0");
}

pub fn wren_raylib_toggle_fullscreen(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.ToggleFullscreen();
}

pub fn wren_raylib_toggle_borderless_windowed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.ToggleBorderlessWindowed();
}

pub fn wren_raylib_maximize_window(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.MaximizeWindow();
}

pub fn wren_raylib_minimize_window(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.MinimizeWindow();
}

pub fn wren_raylib_restore_window(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.RestoreWindow();
}

pub fn wren_raylib_set_window_icon(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    r.SetWindowIcon(@"0");
}

pub fn wren_raylib_set_window_icons(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetWindowIcons(@"0", @"1");
}

pub fn wren_raylib_set_window_title(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.SetWindowTitle(@"0");
}

pub fn wren_raylib_set_window_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetWindowPosition(@"0", @"1");
}

pub fn wren_raylib_set_window_monitor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetWindowMonitor(@"0");
}

pub fn wren_raylib_set_window_min_size(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetWindowMinSize(@"0", @"1");
}

pub fn wren_raylib_set_window_max_size(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetWindowMaxSize(@"0", @"1");
}

pub fn wren_raylib_set_window_size(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetWindowSize(@"0", @"1");
}

pub fn wren_raylib_set_window_opacity(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    r.SetWindowOpacity(@"0");
}

pub fn wren_raylib_set_window_focused(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.SetWindowFocused();
}

pub fn wren_raylib_get_screen_width(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetScreenWidth())));
}

pub fn wren_raylib_get_screen_height(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetScreenHeight())));
}

pub fn wren_raylib_get_render_width(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetRenderWidth())));
}

pub fn wren_raylib_get_render_height(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetRenderHeight())));
}

pub fn wren_raylib_get_monitor_count(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorCount())));
}

pub fn wren_raylib_get_current_monitor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCurrentMonitor())));
}

pub fn wren_raylib_get_monitor_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetMonitorPosition(@"0");
}

pub fn wren_raylib_get_monitor_width(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorWidth(@"0"))));
}

pub fn wren_raylib_get_monitor_height(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorHeight(@"0"))));
}

pub fn wren_raylib_get_monitor_physical_width(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorPhysicalWidth(@"0"))));
}

pub fn wren_raylib_get_monitor_physical_height(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorPhysicalHeight(@"0"))));
}

pub fn wren_raylib_get_monitor_refresh_rate(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMonitorRefreshRate(@"0"))));
}

pub fn wren_raylib_get_window_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetWindowPosition();
}

pub fn wren_raylib_get_window_scale_d_p_i(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetWindowScaleDPI();
}

pub fn wren_raylib_get_monitor_name(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotString(vm, 0, r.GetMonitorName(@"0"));
}

pub fn wren_raylib_set_clipboard_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.SetClipboardText(@"0");
}

pub fn wren_raylib_get_clipboard_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotString(vm, 0, r.GetClipboardText());
}

pub fn wren_raylib_get_clipboard_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetClipboardImage();
}

pub fn wren_raylib_enable_event_waiting(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EnableEventWaiting();
}

pub fn wren_raylib_disable_event_waiting(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.DisableEventWaiting();
}

pub fn wren_raylib_show_cursor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.ShowCursor();
}

pub fn wren_raylib_hide_cursor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.HideCursor();
}

pub fn wren_raylib_is_cursor_hidden(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsCursorHidden());
}

pub fn wren_raylib_enable_cursor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EnableCursor();
}

pub fn wren_raylib_disable_cursor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.DisableCursor();
}

pub fn wren_raylib_is_cursor_on_screen(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsCursorOnScreen());
}

pub fn wren_raylib_clear_background(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    r.ClearBackground(@"0");
}

pub fn wren_raylib_begin_drawing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.BeginDrawing();
}

pub fn wren_raylib_end_drawing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndDrawing();
}

pub fn wren_raylib_begin_mode2_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera2D = ptr_0.?.*;
    r.BeginMode2D(@"0");
}

pub fn wren_raylib_end_mode2_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndMode2D();
}

pub fn wren_raylib_begin_mode3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera3D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera3D = ptr_0.?.*;
    r.BeginMode3D(@"0");
}

pub fn wren_raylib_end_mode3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndMode3D();
}

pub fn wren_raylib_begin_texture_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.RenderTexture2D = ptr_0.?.*;
    r.BeginTextureMode(@"0");
}

pub fn wren_raylib_end_texture_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndTextureMode();
}

pub fn wren_raylib_begin_shader_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    r.BeginShaderMode(@"0");
}

pub fn wren_raylib_end_shader_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndShaderMode();
}

pub fn wren_raylib_begin_blend_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.BeginBlendMode(@"0");
}

pub fn wren_raylib_end_blend_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndBlendMode();
}

pub fn wren_raylib_begin_scissor_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    r.BeginScissorMode(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_end_scissor_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndScissorMode();
}

pub fn wren_raylib_begin_vr_stereo_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.VrStereoConfig = @alignCast(@ptrCast(foreign_0));
    const @"0": r.VrStereoConfig = ptr_0.?.*;
    r.BeginVrStereoMode(@"0");
}

pub fn wren_raylib_end_vr_stereo_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.EndVrStereoMode();
}

pub fn wren_raylib_load_vr_stereo_config(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.VrDeviceInfo = @alignCast(@ptrCast(foreign_0));
    const @"0": r.VrDeviceInfo = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.VrStereoConfig));

    const ptr: *r.VrStereoConfig = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadVrStereoConfig(@"0");
}

pub fn wren_raylib_unload_vr_stereo_config(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.VrStereoConfig = @alignCast(@ptrCast(foreign_0));
    const @"0": r.VrStereoConfig = ptr_0.?.*;
    r.UnloadVrStereoConfig(@"0");
}

pub fn wren_raylib_load_shader(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Shader));

    const ptr: *r.Shader = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadShader(@"0", @"1");
}

pub fn wren_raylib_load_shader_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Shader));

    const ptr: *r.Shader = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadShaderFromMemory(@"0", @"1");
}

pub fn wren_raylib_is_shader_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsShaderValid(@"0"));
}

pub fn wren_raylib_get_shader_location(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetShaderLocation(@"0", @"1"))));
}

pub fn wren_raylib_get_shader_location_attrib(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetShaderLocationAttrib(@"0", @"1"))));
}

pub fn wren_raylib_set_shader_value_matrix(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Matrix = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Matrix = ptr_2.?.*;
    r.SetShaderValueMatrix(@"0", @"1", @"2");
}

pub fn wren_raylib_set_shader_value_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Texture2D = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Texture2D = ptr_2.?.*;
    r.SetShaderValueTexture(@"0", @"1", @"2");
}

pub fn wren_raylib_unload_shader(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Shader = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Shader = ptr_0.?.*;
    r.UnloadShader(@"0");
}

pub fn wren_raylib_get_screen_to_world_ray(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Ray));

    const ptr: *r.Ray = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetScreenToWorldRay(@"0", @"1");
}

pub fn wren_raylib_get_screen_to_world_ray_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Ray));

    const ptr: *r.Ray = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetScreenToWorldRayEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_world_to_screen(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetWorldToScreen(@"0", @"1");
}

pub fn wren_raylib_get_world_to_screen_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetWorldToScreenEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_world_to_screen2_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera2D = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera2D = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetWorldToScreen2D(@"0", @"1");
}

pub fn wren_raylib_get_screen_to_world2_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Camera2D = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Camera2D = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetScreenToWorld2D(@"0", @"1");
}

pub fn wren_raylib_get_camera_matrix(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Matrix));

    const ptr: *r.Matrix = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetCameraMatrix(@"0");
}

pub fn wren_raylib_get_camera_matrix2_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera2D = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Matrix));

    const ptr: *r.Matrix = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetCameraMatrix2D(@"0");
}

pub fn wren_raylib_set_target_f_p_s(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetTargetFPS(@"0");
}

pub fn wren_raylib_get_frame_time(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetFrameTime());
}

pub fn wren_raylib_get_time(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetTime());
}

pub fn wren_raylib_get_f_p_s(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetFPS())));
}

pub fn wren_raylib_swap_screen_buffer(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.SwapScreenBuffer();
}

pub fn wren_raylib_poll_input_events(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.PollInputEvents();
}

pub fn wren_raylib_wait_time(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotDouble(vm, 1);
    r.WaitTime(@"0");
}

pub fn wren_raylib_set_random_seed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetRandomSeed(@"0");
}

pub fn wren_raylib_get_random_value(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetRandomValue(@"0", @"1"))));
}

pub fn wren_raylib_load_random_sequence(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.LoadRandomSequence(@"0", @"1", @"2"))));
}

pub fn wren_raylib_unload_random_sequence(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.UnloadRandomSequence(@"0");
}

pub fn wren_raylib_take_screenshot(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.TakeScreenshot(@"0");
}

pub fn wren_raylib_set_config_flags(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetConfigFlags(@"0");
}

pub fn wren_raylib_open_u_r_l(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.OpenURL(@"0");
}

pub fn wren_raylib_set_trace_log_level(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetTraceLogLevel(@"0");
}

pub fn wren_raylib_mem_alloc(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    //r.MemAlloc(@"0");
}

pub fn wren_raylib_set_trace_log_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.TraceLogCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.TraceLogCallback = ptr_0.?.*;
    r.SetTraceLogCallback(@"0");
}

pub fn wren_raylib_set_load_file_data_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.LoadFileDataCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.LoadFileDataCallback = ptr_0.?.*;
    r.SetLoadFileDataCallback(@"0");
}

pub fn wren_raylib_set_save_file_data_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.SaveFileDataCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.SaveFileDataCallback = ptr_0.?.*;
    r.SetSaveFileDataCallback(@"0");
}

pub fn wren_raylib_set_load_file_text_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.LoadFileTextCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.LoadFileTextCallback = ptr_0.?.*;
    r.SetLoadFileTextCallback(@"0");
}

pub fn wren_raylib_set_save_file_text_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.SaveFileTextCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.SaveFileTextCallback = ptr_0.?.*;
    r.SetSaveFileTextCallback(@"0");
}

pub fn wren_raylib_load_file_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotString(vm, 0, r.LoadFileData(@"0", @"1"));
}

pub fn wren_raylib_unload_file_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //r.UnloadFileData(@"0");
}

pub fn wren_raylib_export_data_as_code(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotString(vm, 3);
    wren.wrenSetSlotBool(vm, 0, r.ExportDataAsCode(@"0", @"1", @"2"));
}

pub fn wren_raylib_load_file_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.LoadFileText(@"0"));
}

pub fn wren_raylib_unload_file_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //r.UnloadFileText(@"0");
}

pub fn wren_raylib_save_file_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //wren.wrenSetSlotBool(vm, 0, r.SaveFileText(@"0", @"1"));
}

pub fn wren_raylib_file_exists(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotBool(vm, 0, r.FileExists(@"0"));
}

pub fn wren_raylib_directory_exists(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotBool(vm, 0, r.DirectoryExists(@"0"));
}

pub fn wren_raylib_is_file_extension(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.IsFileExtension(@"0", @"1"));
}

pub fn wren_raylib_get_file_length(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetFileLength(@"0"))));
}

pub fn wren_raylib_get_file_extension(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.GetFileExtension(@"0"));
}

pub fn wren_raylib_get_file_name(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.GetFileName(@"0"));
}

pub fn wren_raylib_get_file_name_without_ext(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.GetFileNameWithoutExt(@"0"));
}

pub fn wren_raylib_get_directory_path(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.GetDirectoryPath(@"0"));
}

pub fn wren_raylib_get_prev_directory_path(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.GetPrevDirectoryPath(@"0"));
}

pub fn wren_raylib_get_working_directory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotString(vm, 0, r.GetWorkingDirectory());
}

pub fn wren_raylib_get_application_directory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotString(vm, 0, r.GetApplicationDirectory());
}

pub fn wren_raylib_make_directory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.MakeDirectory(@"0"))));
}

pub fn wren_raylib_change_directory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotBool(vm, 0, r.ChangeDirectory(@"0"));
}

pub fn wren_raylib_is_path_file(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotBool(vm, 0, r.IsPathFile(@"0"));
}

pub fn wren_raylib_is_file_name_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotBool(vm, 0, r.IsFileNameValid(@"0"));
}

pub fn wren_raylib_load_directory_files(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.FilePathList));

    const ptr: *r.FilePathList = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadDirectoryFiles(@"0");
}

pub fn wren_raylib_load_directory_files_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2" = wren.wrenGetSlotBool(vm, 3);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.FilePathList));

    const ptr: *r.FilePathList = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadDirectoryFilesEx(@"0", @"1", @"2");
}

pub fn wren_raylib_unload_directory_files(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.FilePathList = @alignCast(@ptrCast(foreign_0));
    const @"0": r.FilePathList = ptr_0.?.*;
    r.UnloadDirectoryFiles(@"0");
}

pub fn wren_raylib_is_file_dropped(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsFileDropped());
}

pub fn wren_raylib_load_dropped_files(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.FilePathList));

    const ptr: *r.FilePathList = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadDroppedFiles();
}

pub fn wren_raylib_unload_dropped_files(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.FilePathList = @alignCast(@ptrCast(foreign_0));
    const @"0": r.FilePathList = ptr_0.?.*;
    r.UnloadDroppedFiles(@"0");
}

pub fn wren_raylib_get_file_mod_time(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetFileModTime(@"0"))));
}

pub fn wren_raylib_compress_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotString(vm, 0, r.CompressData(@"0", @"1", @"2"));
}

pub fn wren_raylib_decompress_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotString(vm, 0, r.DecompressData(@"0", @"1", @"2"));
}

pub fn wren_raylib_encode_data_base64(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotString(vm, 0, r.EncodeDataBase64(@"0", @"1", @"2"));
}

pub fn wren_raylib_decode_data_base64(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotString(vm, 0, r.DecodeDataBase64(@"0", @"1"));
}

pub fn wren_raylib_compute_c_r_c32(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeCRC32(@"0", @"1"))));
}

pub fn wren_raylib_compute_m_d5(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeMD5(@"0", @"1"))));
}

pub fn wren_raylib_compute_s_h_a1(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeSHA1(@"0", @"1"))));
}

pub fn wren_raylib_load_automation_event_list(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.AutomationEventList));

    const ptr: *r.AutomationEventList = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadAutomationEventList(@"0");
}

pub fn wren_raylib_unload_automation_event_list(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AutomationEventList = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AutomationEventList = ptr_0.?.*;
    r.UnloadAutomationEventList(@"0");
}

pub fn wren_raylib_export_automation_event_list(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AutomationEventList = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AutomationEventList = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportAutomationEventList(@"0", @"1"));
}

pub fn wren_raylib_set_automation_event_list(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AutomationEventList = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.AutomationEventList = ptr_0.?;
    r.SetAutomationEventList(@"0");
}

pub fn wren_raylib_set_automation_event_base_frame(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetAutomationEventBaseFrame(@"0");
}

pub fn wren_raylib_start_automation_event_recording(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.StartAutomationEventRecording();
}

pub fn wren_raylib_stop_automation_event_recording(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.StopAutomationEventRecording();
}

pub fn wren_raylib_play_automation_event(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AutomationEvent = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AutomationEvent = ptr_0.?.*;
    r.PlayAutomationEvent(@"0");
}

pub fn wren_raylib_is_key_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsKeyPressed(@"0"));
}

pub fn wren_raylib_is_key_pressed_repeat(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsKeyPressedRepeat(@"0"));
}

pub fn wren_raylib_is_key_down(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsKeyDown(@"0"));
}

pub fn wren_raylib_is_key_released(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsKeyReleased(@"0"));
}

pub fn wren_raylib_is_key_up(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsKeyUp(@"0"));
}

pub fn wren_raylib_get_key_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetKeyPressed())));
}

pub fn wren_raylib_get_char_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCharPressed())));
}

pub fn wren_raylib_set_exit_key(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetExitKey(@"0");
}

pub fn wren_raylib_is_gamepad_available(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsGamepadAvailable(@"0"));
}

pub fn wren_raylib_get_gamepad_name(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotString(vm, 0, r.GetGamepadName(@"0"));
}

pub fn wren_raylib_is_gamepad_button_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotBool(vm, 0, r.IsGamepadButtonPressed(@"0", @"1"));
}

pub fn wren_raylib_is_gamepad_button_down(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotBool(vm, 0, r.IsGamepadButtonDown(@"0", @"1"));
}

pub fn wren_raylib_is_gamepad_button_released(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotBool(vm, 0, r.IsGamepadButtonReleased(@"0", @"1"));
}

pub fn wren_raylib_is_gamepad_button_up(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotBool(vm, 0, r.IsGamepadButtonUp(@"0", @"1"));
}

pub fn wren_raylib_get_gamepad_button_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetGamepadButtonPressed())));
}

pub fn wren_raylib_get_gamepad_axis_count(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetGamepadAxisCount(@"0"))));
}

pub fn wren_raylib_get_gamepad_axis_movement(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, r.GetGamepadAxisMovement(@"0", @"1"));
}

pub fn wren_raylib_set_gamepad_mappings(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.SetGamepadMappings(@"0"))));
}

pub fn wren_raylib_set_gamepad_vibration(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    r.SetGamepadVibration(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_is_mouse_button_pressed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsMouseButtonPressed(@"0"));
}

pub fn wren_raylib_is_mouse_button_down(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsMouseButtonDown(@"0"));
}

pub fn wren_raylib_is_mouse_button_released(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsMouseButtonReleased(@"0"));
}

pub fn wren_raylib_is_mouse_button_up(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsMouseButtonUp(@"0"));
}

pub fn wren_raylib_get_mouse_x(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMouseX())));
}

pub fn wren_raylib_get_mouse_y(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetMouseY())));
}

pub fn wren_raylib_get_mouse_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetMousePosition();
}

pub fn wren_raylib_get_mouse_delta(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetMouseDelta();
}

pub fn wren_raylib_set_mouse_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetMousePosition(@"0", @"1");
}

pub fn wren_raylib_set_mouse_offset(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetMouseOffset(@"0", @"1");
}

pub fn wren_raylib_set_mouse_scale(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetMouseScale(@"0", @"1");
}

pub fn wren_raylib_get_mouse_wheel_move(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetMouseWheelMove());
}

pub fn wren_raylib_get_mouse_wheel_move_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetMouseWheelMoveV();
}

pub fn wren_raylib_set_mouse_cursor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetMouseCursor(@"0");
}

pub fn wren_raylib_get_touch_x(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetTouchX())));
}

pub fn wren_raylib_get_touch_y(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetTouchY())));
}

pub fn wren_raylib_get_touch_position(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetTouchPosition(@"0");
}

pub fn wren_raylib_get_touch_point_id(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetTouchPointId(@"0"))));
}

pub fn wren_raylib_get_touch_point_count(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetTouchPointCount())));
}

pub fn wren_raylib_set_gestures_enabled(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetGesturesEnabled(@"0");
}

pub fn wren_raylib_is_gesture_detected(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsGestureDetected(@"0"));
}

pub fn wren_raylib_get_gesture_detected(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetGestureDetected())));
}

pub fn wren_raylib_get_gesture_hold_duration(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetGestureHoldDuration());
}

pub fn wren_raylib_get_gesture_drag_vector(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetGestureDragVector();
}

pub fn wren_raylib_get_gesture_drag_angle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetGestureDragAngle());
}

pub fn wren_raylib_get_gesture_pinch_vector(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetGesturePinchVector();
}

pub fn wren_raylib_get_gesture_pinch_angle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetGesturePinchAngle());
}

pub fn wren_raylib_update_camera(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Camera = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.UpdateCamera(@"0", @"1");
}

pub fn wren_raylib_update_camera_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Camera = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    r.UpdateCameraPro(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_pixel(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawPixel(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_pixel_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.DrawPixelV(@"0", @"1");
}

pub fn wren_raylib_draw_line(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawLine(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_line_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawLineV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_line_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawLineEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_line_strip(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawLineStrip(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_line_bezier(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawLineBezier(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_circle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawCircle(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_circle_sector(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCircleSector(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_circle_sector_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCircleSectorLines(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_circle_gradient(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawCircleGradient(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_circle_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCircleV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_circle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawCircleLines(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_circle_lines_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCircleLinesV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_ellipse(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawEllipse(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_ellipse_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawEllipseLines(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_ring(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const @"5": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 6));
    const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    const ptr_6: ?*r.Color = @alignCast(@ptrCast(foreign_6));
    const @"6": r.Color = ptr_6.?.*;
    r.DrawRing(@"0", @"1", @"2", @"3", @"4", @"5", @"6");
}

pub fn wren_raylib_draw_ring_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const @"5": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 6));
    const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    const ptr_6: ?*r.Color = @alignCast(@ptrCast(foreign_6));
    const @"6": r.Color = ptr_6.?.*;
    r.DrawRingLines(@"0", @"1", @"2", @"3", @"4", @"5", @"6");
}

pub fn wren_raylib_draw_rectangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawRectangle(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_rectangle_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawRectangleV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_rectangle_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.DrawRectangleRec(@"0", @"1");
}

pub fn wren_raylib_draw_rectangle_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawRectanglePro(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_rectangle_gradient_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawRectangleGradientV(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_rectangle_gradient_h(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawRectangleGradientH(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_rectangle_gradient_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawRectangleGradientEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_rectangle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawRectangleLines(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_rectangle_lines_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawRectangleLinesEx(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_rectangle_rounded(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawRectangleRounded(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_rectangle_rounded_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawRectangleRoundedLines(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_rectangle_rounded_lines_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawRectangleRoundedLinesEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_triangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawTriangle(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_triangle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawTriangleLines(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_triangle_fan(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawTriangleFan(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_triangle_strip(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawTriangleStrip(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_poly(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawPoly(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_poly_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawPolyLines(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_poly_lines_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawPolyLinesEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_spline_linear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineLinear(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_basis(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineBasis(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_catmull_rom(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineCatmullRom(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_bezier_quadratic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineBezierQuadratic(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_bezier_cubic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Vector2 = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineBezierCubic(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_segment_linear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineSegmentLinear(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_segment_basis(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawSplineSegmentBasis(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_spline_segment_catmull_rom(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawSplineSegmentCatmullRom(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_spline_segment_bezier_quadratic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawSplineSegmentBezierQuadratic(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_spline_segment_bezier_cubic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawSplineSegmentBezierCubic(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_get_spline_point_linear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetSplinePointLinear(@"0", @"1", @"2");
}

pub fn wren_raylib_get_spline_point_basis(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetSplinePointBasis(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_get_spline_point_catmull_rom(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetSplinePointCatmullRom(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_get_spline_point_bezier_quad(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetSplinePointBezierQuad(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_spline_point_bezier_cubic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetSplinePointBezierCubic(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_check_collision_recs(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionRecs(@"0", @"1"));
}

pub fn wren_raylib_check_collision_circles(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionCircles(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_circle_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionCircleRec(@"0", @"1", @"2"));
}

pub fn wren_raylib_check_collision_circle_line(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionCircleLine(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_point_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionPointRec(@"0", @"1"));
}

pub fn wren_raylib_check_collision_point_circle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionPointCircle(@"0", @"1", @"2"));
}

pub fn wren_raylib_check_collision_point_triangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionPointTriangle(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_point_line(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionPointLine(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_point_poly(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": *r.Vector2 = ptr_1.?;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionPointPoly(@"0", @"1", @"2"));
}

pub fn wren_raylib_check_collision_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector2 = @alignCast(@ptrCast(foreign_4));
    const @"4": *r.Vector2 = ptr_4.?;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionLines(@"0", @"1", @"2", @"3", @"4"));
}

pub fn wren_raylib_get_collision_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Rectangle = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Rectangle = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Rectangle));

    const ptr: *r.Rectangle = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetCollisionRec(@"0", @"1");
}

pub fn wren_raylib_set_shapes_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    r.SetShapesTexture(@"0", @"1");
}

pub fn wren_raylib_get_shapes_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

    const ptr: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetShapesTexture();
}

pub fn wren_raylib_get_shapes_texture_rectangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Rectangle));

    const ptr: *r.Rectangle = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetShapesTextureRectangle();
}

pub fn wren_raylib_load_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImage(@"0");
}

pub fn wren_raylib_load_image_raw(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImageRaw(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_load_image_anim(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImageAnim(@"0", @"1");
}

pub fn wren_raylib_load_image_anim_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("We do not support r.LoadImageAnimFromMemory yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    //const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.LoadImageAnimFromMemory(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_load_image_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImageFromMemory(@"0", @"1", @"2");
}

pub fn wren_raylib_load_image_from_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImageFromTexture(@"0");
}

pub fn wren_raylib_load_image_from_screen(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadImageFromScreen();
}

pub fn wren_raylib_is_image_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsImageValid(@"0"));
}

pub fn wren_raylib_unload_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    r.UnloadImage(@"0");
}

pub fn wren_raylib_export_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportImage(@"0", @"1"));
}

pub fn wren_raylib_export_image_to_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("we do not have support for r.ExportImageFromMemory Yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Image = ptr_0.?.*;
    //const @"1" = wren.wrenGetSlotString(vm, 2);

    // TODO: This should be a list.
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //wren.wrenSetSlotString(vm, 0, r.ExportImageToMemory(@"0", @"1", @"2"));
}

pub fn wren_raylib_export_image_as_code(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportImageAsCode(@"0", @"1"));
}

pub fn wren_raylib_gen_image_color(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageColor(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_image_gradient_linear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageGradientLinear(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_gen_image_gradient_radial(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageGradientRadial(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_gen_image_gradient_square(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageGradientSquare(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_gen_image_checked(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageChecked(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_gen_image_white_noise(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageWhiteNoise(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_image_perlin_noise(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImagePerlinNoise(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_gen_image_cellular(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageCellular(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_image_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotString(vm, 3);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenImageText(@"0", @"1", @"2");
}

pub fn wren_raylib_image_copy(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ImageCopy(@"0");
}

pub fn wren_raylib_image_from_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ImageFromImage(@"0", @"1");
}

pub fn wren_raylib_image_from_channel(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ImageFromChannel(@"0", @"1");
}

pub fn wren_raylib_image_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ImageText(@"0", @"1", @"2");
}

pub fn wren_raylib_image_text_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ImageTextEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_format(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.ImageFormat(@"0", @"1");
}

pub fn wren_raylib_image_to_p_o_t(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.ImageToPOT(@"0", @"1");
}

pub fn wren_raylib_image_crop(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    r.ImageCrop(@"0", @"1");
}

pub fn wren_raylib_image_alpha_crop(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.ImageAlphaCrop(@"0", @"1");
}

pub fn wren_raylib_image_alpha_clear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    r.ImageAlphaClear(@"0", @"1", @"2");
}

pub fn wren_raylib_image_alpha_mask(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Image = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Image = ptr_1.?.*;
    r.ImageAlphaMask(@"0", @"1");
}

pub fn wren_raylib_image_alpha_premultiply(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageAlphaPremultiply(@"0");
}

pub fn wren_raylib_image_blur_gaussian(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.ImageBlurGaussian(@"0", @"1");
}

pub fn wren_raylib_image_kernel_convolution(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Image = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.const float = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.const float = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.ImageKernelConvolution(@"0", @"1", @"2");
}

pub fn wren_raylib_image_resize(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    r.ImageResize(@"0", @"1", @"2");
}

pub fn wren_raylib_image_resize_n_n(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    r.ImageResizeNN(@"0", @"1", @"2");
}

pub fn wren_raylib_image_resize_canvas(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.ImageResizeCanvas(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_image_mipmaps(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageMipmaps(@"0");
}

pub fn wren_raylib_image_dither(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    r.ImageDither(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_flip_vertical(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageFlipVertical(@"0");
}

pub fn wren_raylib_image_flip_horizontal(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageFlipHorizontal(@"0");
}

pub fn wren_raylib_image_rotate(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.ImageRotate(@"0", @"1");
}

pub fn wren_raylib_image_rotate_c_w(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageRotateCW(@"0");
}

pub fn wren_raylib_image_rotate_c_c_w(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageRotateCCW(@"0");
}

pub fn wren_raylib_image_color_tint(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.ImageColorTint(@"0", @"1");
}

pub fn wren_raylib_image_color_invert(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageColorInvert(@"0");
}

pub fn wren_raylib_image_color_grayscale(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    r.ImageColorGrayscale(@"0");
}

pub fn wren_raylib_image_color_contrast(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.ImageColorContrast(@"0", @"1");
}

pub fn wren_raylib_image_color_brightness(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.ImageColorBrightness(@"0", @"1");
}

pub fn wren_raylib_image_color_replace(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.ImageColorReplace(@"0", @"1", @"2");
}

pub fn wren_raylib_load_image_colors(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    var ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr = r.LoadImageColors(@"0");
}

pub fn wren_raylib_load_image_palette(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    var ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr = r.LoadImagePalette(@"0", @"1", @"2");
}

pub fn wren_raylib_unload_image_colors(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Color = ptr_0.?;
    r.UnloadImageColors(@"0");
}

pub fn wren_raylib_unload_image_palette(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Color = ptr_0.?;
    r.UnloadImagePalette(@"0");
}

pub fn wren_raylib_get_image_alpha_border(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Rectangle));

    const ptr: *r.Rectangle = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetImageAlphaBorder(@"0", @"1");
}

pub fn wren_raylib_get_image_color(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetImageColor(@"0", @"1", @"2");
}

pub fn wren_raylib_image_clear_background(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.ImageClearBackground(@"0", @"1");
}

pub fn wren_raylib_image_draw_pixel(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawPixel(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_pixel_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.ImageDrawPixelV(@"0", @"1", @"2");
}

pub fn wren_raylib_image_draw_line(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.ImageDrawLine(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_image_draw_line_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawLineV(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_line_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDrawLineEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_circle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDrawCircle(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_circle_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawCircleV(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_circle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDrawCircleLines(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_circle_lines_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawCircleLinesV(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_rectangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.ImageDrawRectangle(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_image_draw_rectangle_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawRectangleV(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_rectangle_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.ImageDrawRectangleRec(@"0", @"1", @"2");
}

pub fn wren_raylib_image_draw_rectangle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.ImageDrawRectangleLines(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_triangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDrawTriangle(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_triangle_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    const ptr_6: ?*r.Color = @alignCast(@ptrCast(foreign_6));
    const @"6": r.Color = ptr_6.?.*;
    r.ImageDrawTriangleEx(@"0", @"1", @"2", @"3", @"4", @"5", @"6");
}

pub fn wren_raylib_image_draw_triangle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDrawTriangleLines(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_triangle_fan(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.ImageDrawTriangleFan is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Image = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    //const @"1": *r.Vector2 = ptr_1.?;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    //const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    //const @"3": r.Color = ptr_3.?.*;
    //r.ImageDrawTriangleFan(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw_triangle_strip(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.ImageDrawTriangleStrip is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": *r.Image = ptr_0.?;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Vector2 = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    //const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    //const @"3": r.Color = ptr_3.?.*;
    //r.ImageDrawTriangleStrip(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_image_draw(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": *r.Image = ptr_0.?;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Image = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Image = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Rectangle = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Rectangle = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.ImageDraw(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_image_draw_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.ImageDrawText is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Image = ptr_0.?.*;
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    //const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    //const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    //const @"5": r.Color = ptr_5.?.*;
    //r.ImageDrawText(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_image_draw_text_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.ImageDrawTextEx is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Image = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Font = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Font = ptr_1.?.*;
    //const @"2" = wren.wrenGetSlotString(vm, 3);
    //const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    //const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    //const @"3": r.Vector2 = ptr_3.?.*;
    //const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    //const @"5" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 6)));
    //const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    //const ptr_6: ?*r.Color = @alignCast(@ptrCast(foreign_6));
    //const @"6": r.Color = ptr_6.?.*;
    //r.ImageDrawTextEx(@"0", @"1", @"2", @"3", @"4", @"5", @"6");
}

pub fn wren_raylib_load_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

    const ptr: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadTexture(@"0");
}

pub fn wren_raylib_load_texture_from_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Texture2D));

    const ptr: *r.Texture2D = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadTextureFromImage(@"0");
}

pub fn wren_raylib_load_texture_cubemap(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.TextureCubemap));

    const ptr: *r.TextureCubemap = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadTextureCubemap(@"0", @"1");
}

pub fn wren_raylib_load_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));

    const ptr: *r.RenderTexture2D = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadRenderTexture(@"0", @"1");
}

pub fn wren_raylib_is_texture_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsTextureValid(@"0"));
}

pub fn wren_raylib_unload_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    r.UnloadTexture(@"0");
}

pub fn wren_raylib_is_render_texture_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.RenderTexture2D = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsRenderTextureValid(@"0"));
}

pub fn wren_raylib_unload_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.RenderTexture2D = ptr_0.?.*;
    r.UnloadRenderTexture(@"0");
}

pub fn wren_raylib_update_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Texture2D = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.const void = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.const void = ptr_1.?.*;
    //r.UpdateTexture(@"0", @"1");
}

pub fn wren_raylib_update_texture_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Texture2D = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Rectangle = ptr_1.?.*;
    //const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    //const ptr_2: ?*r.const void = @alignCast(@ptrCast(foreign_2));
    //const @"2": r.const void = ptr_2.?.*;
    //r.UpdateTextureRec(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_texture_mipmaps(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.GenTextureMipmaps is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Texture2D = ptr_0.?.*;
    //r.GenTextureMipmaps(@"0");
}

pub fn wren_raylib_set_texture_filter(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetTextureFilter(@"0", @"1");
}

pub fn wren_raylib_set_texture_wrap(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.SetTextureWrap(@"0", @"1");
}

pub fn wren_raylib_draw_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawTexture(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_texture_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawTextureV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_texture_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawTextureEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_texture_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawTextureRec(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_texture_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Rectangle = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawTexturePro(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_texture_n_patch(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Texture2D = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Texture2D = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.NPatchInfo = @alignCast(@ptrCast(foreign_1));
    const @"1": r.NPatchInfo = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawTextureNPatch(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_color_is_equal(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    wren.wrenSetSlotBool(vm, 0, r.ColorIsEqual(@"0", @"1"));
}

pub fn wren_raylib_fade(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.Fade(@"0", @"1");
}

pub fn wren_raylib_color_to_int(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ColorToInt(@"0"))));
}

pub fn wren_raylib_color_normalize(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector4));

    const ptr: *r.Vector4 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorNormalize(@"0");
}

pub fn wren_raylib_color_from_normalized(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector4 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector4 = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorFromNormalized(@"0");
}

pub fn wren_raylib_color_to_h_s_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector3));

    const ptr: *r.Vector3 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorToHSV(@"0");
}

pub fn wren_raylib_color_from_h_s_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorFromHSV(@"0", @"1", @"2");
}

pub fn wren_raylib_color_tint(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorTint(@"0", @"1");
}

pub fn wren_raylib_color_brightness(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorBrightness(@"0", @"1");
}

pub fn wren_raylib_color_contrast(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorContrast(@"0", @"1");
}

pub fn wren_raylib_color_alpha(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorAlpha(@"0", @"1");
}

pub fn wren_raylib_color_alpha_blend(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorAlphaBlend(@"0", @"1", @"2");
}

pub fn wren_raylib_color_lerp(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Color = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Color = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.ColorLerp(@"0", @"1", @"2");
}

pub fn wren_raylib_get_color(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetColor(@"0");
}

pub fn wren_raylib_get_pixel_color(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.GetPixelColor is not supported yet");
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Color));

    //const ptr: *r.Color = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.GetPixelColor(@"0", @"1");
}

pub fn wren_raylib_set_pixel_color(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.SetPixelColor is not supported yet");
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Color = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.SetPixelColor(@"0", @"1", @"2");
}

pub fn wren_raylib_get_pixel_data_size(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetPixelDataSize(@"0", @"1", @"2"))));
}

pub fn wren_raylib_get_font_default(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));

    const ptr: *r.Font = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetFontDefault();
}

pub fn wren_raylib_load_font(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));

    const ptr: *r.Font = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadFont(@"0");
}

pub fn wren_raylib_load_font_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));

    const ptr: *r.Font = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadFontEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_load_font_from_image(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));

    const ptr: *r.Font = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadFontFromImage(@"0", @"1", @"2");
}

pub fn wren_raylib_load_font_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const @"5": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 6));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));

    const ptr: *r.Font = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadFontFromMemory(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_is_font_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsFontValid(@"0"));
}

pub fn wren_raylib_load_font_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.LoadFontData is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    //const @"5": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 6));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.GlyphInfo));

    //const ptr: *r.GlyphInfo = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.LoadFontData(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_gen_image_font_atlas(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.GenImageFontAtlas is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.const GlyphInfo = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.const GlyphInfo = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Rectangle = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Rectangle = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    //const @"5": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 6));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));

    //const ptr: *r.Image = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.GenImageFontAtlas(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_unload_font_data(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UnloadFontData is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.GlyphInfo = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.GlyphInfo = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //r.UnloadFontData(@"0", @"1");
}

pub fn wren_raylib_unload_font(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    r.UnloadFont(@"0");
}

pub fn wren_raylib_export_font_as_code(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportFontAsCode(@"0", @"1"));
}

pub fn wren_raylib_draw_f_p_s(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.DrawFPS(@"0", @"1");
}

pub fn wren_raylib_draw_text_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawTextEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_text_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector2 = ptr_3.?.*;
    const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    const @"5" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 6)));
    const @"6" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 7)));
    const foreign_7 = wren.wrenGetSlotForeign(vm, 8);
    const ptr_7: ?*r.Color = @alignCast(@ptrCast(foreign_7));
    const @"7": r.Color = ptr_7.?.*;
    r.DrawTextPro(@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7");
}

pub fn wren_raylib_draw_text_codepoint(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawTextCodepoint(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_text_codepoints(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("DrawTextCodepoint is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Font = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.const int = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.const int = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    //const ptr_3: ?*r.Vector2 = @alignCast(@ptrCast(foreign_3));
    //const @"3": r.Vector2 = ptr_3.?.*;
    //const @"4" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 5)));
    //const @"5" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 6)));
    //const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    //const ptr_6: ?*r.Color = @alignCast(@ptrCast(foreign_6));
    //const @"6": r.Color = ptr_6.?.*;
    //r.DrawTextCodepoints(@"0", @"1", @"2", @"3", @"4", @"5", @"6");
}

pub fn wren_raylib_set_text_line_spacing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetTextLineSpacing(@"0");
}

pub fn wren_raylib_measure_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.MeasureText(@"0", @"1"))));
}

pub fn wren_raylib_measure_text_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

    const ptr: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.MeasureTextEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_glyph_index(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetGlyphIndex(@"0", @"1"))));
}

pub fn wren_raylib_get_glyph_info(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.GlyphInfo));

    const ptr: *r.GlyphInfo = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetGlyphInfo(@"0", @"1");
}

pub fn wren_raylib_get_glyph_atlas_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Font = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Font = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Rectangle));

    const ptr: *r.Rectangle = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetGlyphAtlasRec(@"0", @"1");
}

pub fn wren_raylib_load_u_t_f8(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.LoadUTF8 is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.const int = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.const int = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //wren.wrenSetSlotString(vm, 0, r.LoadUTF8(@"0", @"1"));
}

pub fn wren_raylib_unload_u_t_f8(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UnloadUTF8 is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //r.UnloadUTF8(@"0");
}

pub fn wren_raylib_load_codepoints(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.LoadCodepoints is not supported");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.LoadCodepoints(@"0", @"1"))));
}

pub fn wren_raylib_unload_codepoints(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.UnloadCodepoints(@"0");
}

pub fn wren_raylib_get_codepoint_count(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCodepointCount(@"0"))));
}

pub fn wren_raylib_get_codepoint(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCodepoint(@"0", @"1"))));
}

pub fn wren_raylib_get_codepoint_next(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCodepointNext(@"0", @"1"))));
}

pub fn wren_raylib_get_codepoint_previous(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.GetCodepointPrevious(@"0", @"1"))));
}

pub fn wren_raylib_codepoint_to_u_t_f8(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotString(vm, 0, r.CodepointToUTF8(@"0", @"1"));
}

pub fn wren_raylib_text_copy(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextCopy is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.TextCopy(@"0", @"1"))));
}

pub fn wren_raylib_text_is_equal(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.TextIsEqual(@"0", @"1"));
}

pub fn wren_raylib_text_length(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.TextLength(@"0"))));
}

pub fn wren_raylib_text_format(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextFormat is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.... = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.... = ptr_1.?.*;
    //wren.wrenSetSlotString(vm, 0, r.TextFormat(@"0", @"1"));
}

pub fn wren_raylib_text_subtext(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotString(vm, 0, r.TextSubtext(@"0", @"1", @"2"));
}

pub fn wren_raylib_text_replace(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2" = wren.wrenGetSlotString(vm, 3);
    wren.wrenSetSlotString(vm, 0, r.TextReplace(@"0", @"1", @"2"));
}

pub fn wren_raylib_text_insert(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextJoin is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //wren.wrenSetSlotString(vm, 0, r.TextInsert(@"0", @"1", @"2"));
}

pub fn wren_raylib_text_join(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextJoin is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2" = wren.wrenGetSlotString(vm, 3);
    //wren.wrenSetSlotString(vm, 0, r.TextJoin(@"0", @"1", @"2"));
}

pub fn wren_raylib_text_split(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextSplit is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //wren.wrenSetSlotString(vm, 0, r.TextSplit(@"0", @"1", @"2"));
}

pub fn wren_raylib_text_append(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.TextAppend is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1" = wren.wrenGetSlotString(vm, 2);
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.TextAppend(@"0", @"1", @"2");
}

pub fn wren_raylib_text_find_index(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.TextFindIndex(@"0", @"1"))));
}

pub fn wren_raylib_text_to_upper(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.TextToUpper(@"0"));
}

pub fn wren_raylib_text_to_lower(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.TextToLower(@"0"));
}

pub fn wren_raylib_text_to_pascal(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.TextToPascal(@"0"));
}

pub fn wren_raylib_text_to_snake(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.TextToSnake(@"0"));
}

pub fn wren_raylib_text_to_camel(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotString(vm, 0, r.TextToCamel(@"0"));
}

pub fn wren_raylib_text_to_integer(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.TextToInteger(@"0"))));
}

pub fn wren_raylib_text_to_float(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, r.TextToFloat(@"0"));
}

pub fn wren_raylib_draw_line3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawLine3D(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_point3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.DrawPoint3D(@"0", @"1");
}

pub fn wren_raylib_draw_circle3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawCircle3D(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_triangle3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawTriangle3D(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_triangle_strip3_d(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.DrawTriangleStrip3D is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.const Vector3 = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.const Vector3 = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    //const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    //const @"2": r.Color = ptr_2.?.*;
    //r.DrawTriangleStrip3D(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_cube(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawCube(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_cube_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCubeV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_cube_wires(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawCubeWires(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_cube_wires_v(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCubeWiresV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_sphere(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawSphere(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_sphere_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawSphereEx(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_sphere_wires(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawSphereWires(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_cylinder(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCylinder(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_cylinder_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCylinderEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_cylinder_wires(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCylinderWires(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_cylinder_wires_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCylinderWiresEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_capsule(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCapsule(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_capsule_wires(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawCapsuleWires(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_plane(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector2 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector2 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawPlane(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_ray(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.DrawRay(@"0", @"1");
}

pub fn wren_raylib_draw_grid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.DrawGrid(@"0", @"1");
}

pub fn wren_raylib_load_model(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Model));

    const ptr: *r.Model = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadModel(@"0");
}

pub fn wren_raylib_load_model_from_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Model));

    const ptr: *r.Model = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadModelFromMesh(@"0");
}

pub fn wren_raylib_is_model_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsModelValid(@"0"));
}

pub fn wren_raylib_unload_model(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    r.UnloadModel(@"0");
}

pub fn wren_raylib_get_model_bounding_box(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.BoundingBox));

    const ptr: *r.BoundingBox = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetModelBoundingBox(@"0");
}

pub fn wren_raylib_draw_model(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawModel(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_model_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector3 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector3 = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawModelEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_model_wires(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawModelWires(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_model_wires_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector3 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector3 = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawModelWiresEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_model_points(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawModelPoints(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_model_points_ex(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector3 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector3 = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawModelPointsEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_bounding_box(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.BoundingBox = @alignCast(@ptrCast(foreign_0));
    const @"0": r.BoundingBox = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Color = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Color = ptr_1.?.*;
    r.DrawBoundingBox(@"0", @"1");
}

pub fn wren_raylib_draw_billboard(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Texture2D = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Texture2D = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawBillboard(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_billboard_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Texture2D = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Texture2D = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector3 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector3 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector2 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector2 = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawBillboardRec(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_billboard_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Texture2D = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Texture2D = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Rectangle = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Rectangle = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector3 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector3 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector3 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector3 = ptr_4.?.*;
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Vector2 = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Vector2 = ptr_5.?.*;
    const foreign_6 = wren.wrenGetSlotForeign(vm, 7);
    const ptr_6: ?*r.Vector2 = @alignCast(@ptrCast(foreign_6));
    const @"6": r.Vector2 = ptr_6.?.*;
    const @"7" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 8)));
    const foreign_8 = wren.wrenGetSlotForeign(vm, 9);
    const ptr_8: ?*r.Color = @alignCast(@ptrCast(foreign_8));
    const @"8": r.Color = ptr_8.?.*;
    r.DrawBillboardPro(@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8");
}

pub fn wren_raylib_upload_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UploadMesh is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Mesh = ptr_0.?.*;
    //const @"1" = wren.wrenGetSlotBool(vm, 2);
    //r.UploadMesh(@"0", @"1");
}

pub fn wren_raylib_update_mesh_buffer(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UpdateMeshBuffer is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Mesh = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    //const ptr_2: ?*r.const void = @alignCast(@ptrCast(foreign_2));
    //const @"2": r.const void = ptr_2.?.*;
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //const @"4": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 5));
    //r.UpdateMeshBuffer(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_unload_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    r.UnloadMesh(@"0");
}

pub fn wren_raylib_draw_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Material = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Material = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Matrix = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Matrix = ptr_2.?.*;
    r.DrawMesh(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_mesh_instanced(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.DrawMeshInstanced is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Mesh = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.Material = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.Material = ptr_1.?.*;
    //const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    //const ptr_2: ?*r.const Matrix = @alignCast(@ptrCast(foreign_2));
    //const @"2": r.const Matrix = ptr_2.?.*;
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //r.DrawMeshInstanced(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_mesh_bounding_box(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.BoundingBox));

    const ptr: *r.BoundingBox = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetMeshBoundingBox(@"0");
}

pub fn wren_raylib_gen_mesh_tangents(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.GenMeshTangents is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Mesh = ptr_0.?.*;
    //r.GenMeshTangents(@"0");
}

pub fn wren_raylib_export_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportMesh(@"0", @"1"));
}

pub fn wren_raylib_export_mesh_as_code(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Mesh = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Mesh = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportMeshAsCode(@"0", @"1"));
}

pub fn wren_raylib_gen_mesh_poly(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshPoly(@"0", @"1");
}

pub fn wren_raylib_gen_mesh_plane(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshPlane(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_gen_mesh_cube(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshCube(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_mesh_sphere(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshSphere(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_mesh_hemi_sphere(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshHemiSphere(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_mesh_cylinder(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshCylinder(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_mesh_cone(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshCone(@"0", @"1", @"2");
}

pub fn wren_raylib_gen_mesh_torus(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshTorus(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_gen_mesh_knot(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshKnot(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_gen_mesh_heightmap(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshHeightmap(@"0", @"1");
}

pub fn wren_raylib_gen_mesh_cubicmap(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Image = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Image = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Mesh));

    const ptr: *r.Mesh = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GenMeshCubicmap(@"0", @"1");
}

pub fn wren_raylib_load_materials(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.LoadMaterials is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Material));

    //const ptr: *r.Material = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.LoadMaterials(@"0", @"1");
}

pub fn wren_raylib_load_material_default(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Material));

    const ptr: *r.Material = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadMaterialDefault();
}

pub fn wren_raylib_is_material_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Material = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Material = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsMaterialValid(@"0"));
}

pub fn wren_raylib_unload_material(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Material = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Material = ptr_0.?.*;
    r.UnloadMaterial(@"0");
}

pub fn wren_raylib_set_material_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.SetMaterialTexture is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Material = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Material = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    //const ptr_2: ?*r.Texture2D = @alignCast(@ptrCast(foreign_2));
    //const @"2": r.Texture2D = ptr_2.?.*;
    //r.SetMaterialTexture(@"0", @"1", @"2");
}

pub fn wren_raylib_set_model_mesh_material(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.SetModelMeshMaterial is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Model = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.SetModelMeshMaterial(@"0", @"1", @"2");
}

pub fn wren_raylib_load_model_animations(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.LoadModelAnimations is not supported yet");
    //const @"0" = wren.wrenGetSlotString(vm, 1);
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.ModelAnimation));

    //const ptr: *r.ModelAnimation = @alignCast(@ptrCast(foreign_ptr));
    //ptr.* = r.LoadModelAnimations(@"0", @"1");
}

pub fn wren_raylib_update_model_animation(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.ModelAnimation = @alignCast(@ptrCast(foreign_1));
    const @"1": r.ModelAnimation = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    r.UpdateModelAnimation(@"0", @"1", @"2");
}

pub fn wren_raylib_update_model_animation_bones(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.ModelAnimation = @alignCast(@ptrCast(foreign_1));
    const @"1": r.ModelAnimation = ptr_1.?.*;
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    r.UpdateModelAnimationBones(@"0", @"1", @"2");
}

pub fn wren_raylib_unload_model_animation(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.ModelAnimation = @alignCast(@ptrCast(foreign_0));
    const @"0": r.ModelAnimation = ptr_0.?.*;
    r.UnloadModelAnimation(@"0");
}

pub fn wren_raylib_unload_model_animations(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UnloadModelAnimations is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.ModelAnimation = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.ModelAnimation = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //r.UnloadModelAnimations(@"0", @"1");
}

pub fn wren_raylib_is_model_animation_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Model = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Model = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.ModelAnimation = @alignCast(@ptrCast(foreign_1));
    const @"1": r.ModelAnimation = ptr_1.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsModelAnimationValid(@"0", @"1"));
}

pub fn wren_raylib_check_collision_spheres(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector3 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector3 = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 4)));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionSpheres(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_boxes(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.BoundingBox = @alignCast(@ptrCast(foreign_0));
    const @"0": r.BoundingBox = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.BoundingBox = @alignCast(@ptrCast(foreign_1));
    const @"1": r.BoundingBox = ptr_1.?.*;
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionBoxes(@"0", @"1"));
}

pub fn wren_raylib_check_collision_box_sphere(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.BoundingBox = @alignCast(@ptrCast(foreign_0));
    const @"0": r.BoundingBox = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionBoxSphere(@"0", @"1", @"2"));
}

pub fn wren_raylib_get_ray_collision_sphere(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const @"2" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 3)));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RayCollision));

    const ptr: *r.RayCollision = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetRayCollisionSphere(@"0", @"1", @"2");
}

pub fn wren_raylib_get_ray_collision_box(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.BoundingBox = @alignCast(@ptrCast(foreign_1));
    const @"1": r.BoundingBox = ptr_1.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RayCollision));

    const ptr: *r.RayCollision = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetRayCollisionBox(@"0", @"1");
}

pub fn wren_raylib_get_ray_collision_mesh(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Mesh = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Mesh = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Matrix = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Matrix = ptr_2.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RayCollision));

    const ptr: *r.RayCollision = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetRayCollisionMesh(@"0", @"1", @"2");
}

pub fn wren_raylib_get_ray_collision_triangle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector3 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector3 = ptr_3.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RayCollision));

    const ptr: *r.RayCollision = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetRayCollisionTriangle(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_get_ray_collision_quad(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Ray = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Ray = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Vector3 = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Vector3 = ptr_3.?.*;
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Vector3 = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Vector3 = ptr_4.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RayCollision));

    const ptr: *r.RayCollision = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.GetRayCollisionQuad(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_init_audio_device(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.InitAudioDevice();
}

pub fn wren_raylib_close_audio_device(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    r.CloseAudioDevice();
}

pub fn wren_raylib_is_audio_device_ready(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotBool(vm, 0, r.IsAudioDeviceReady());
}

pub fn wren_raylib_set_master_volume(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    r.SetMasterVolume(@"0");
}

pub fn wren_raylib_get_master_volume(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    wren.wrenSetSlotDouble(vm, 0, r.GetMasterVolume());
}

pub fn wren_raylib_load_wave(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Wave));

    const ptr: *r.Wave = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadWave(@"0");
}

pub fn wren_raylib_load_wave_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Wave));

    const ptr: *r.Wave = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadWaveFromMemory(@"0", @"1", @"2");
}

pub fn wren_raylib_is_wave_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsWaveValid(@"0"));
}

pub fn wren_raylib_load_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Sound));

    const ptr: *r.Sound = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadSound(@"0");
}

pub fn wren_raylib_load_sound_from_wave(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Sound));

    const ptr: *r.Sound = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadSoundFromWave(@"0");
}

pub fn wren_raylib_load_sound_alias(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Sound));

    const ptr: *r.Sound = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadSoundAlias(@"0");
}

pub fn wren_raylib_is_sound_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsSoundValid(@"0"));
}

pub fn wren_raylib_update_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UpdateSound is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Sound = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.const void = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.const void = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.UpdateSound(@"0", @"1", @"2");
}

pub fn wren_raylib_unload_wave(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    r.UnloadWave(@"0");
}

pub fn wren_raylib_unload_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.UnloadSound(@"0");
}

pub fn wren_raylib_unload_sound_alias(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.UnloadSoundAlias(@"0");
}

pub fn wren_raylib_export_wave(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportWave(@"0", @"1"));
}

pub fn wren_raylib_export_wave_as_code(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.ExportWaveAsCode(@"0", @"1"));
}

pub fn wren_raylib_play_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.PlaySound(@"0");
}

pub fn wren_raylib_stop_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.StopSound(@"0");
}

pub fn wren_raylib_pause_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.PauseSound(@"0");
}

pub fn wren_raylib_resume_sound(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    r.ResumeSound(@"0");
}

pub fn wren_raylib_is_sound_playing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsSoundPlaying(@"0"));
}

pub fn wren_raylib_set_sound_volume(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetSoundVolume(@"0", @"1");
}

pub fn wren_raylib_set_sound_pitch(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetSoundPitch(@"0", @"1");
}

pub fn wren_raylib_set_sound_pan(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Sound = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Sound = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetSoundPan(@"0", @"1");
}

pub fn wren_raylib_wave_copy(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Wave = ptr_0.?.*;
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Wave));

    const ptr: *r.Wave = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.WaveCopy(@"0");
}

pub fn wren_raylib_wave_crop(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Wave = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.WaveCrop(@"0", @"1", @"2");
}

pub fn wren_raylib_wave_format(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Wave = ptr_0.?.*;
    //const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //const @"3": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));
    //r.WaveFormat(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_load_wave_samples(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.Wave = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.Wave = ptr_0.?.*;
    //wren.wrenSetSlotDouble(vm, 0, r.LoadWaveSamples(@"0"));
}

pub fn wren_raylib_unload_wave_samples(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    //const @"0" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 1)));
    //r.UnloadWaveSamples(@"0");
}

pub fn wren_raylib_load_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Music));

    const ptr: *r.Music = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadMusicStream(@"0");
}

pub fn wren_raylib_load_music_stream_from_memory(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Music));

    const ptr: *r.Music = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadMusicStreamFromMemory(@"0", @"1", @"2");
}

pub fn wren_raylib_is_music_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsMusicValid(@"0"));
}

pub fn wren_raylib_unload_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.UnloadMusicStream(@"0");
}

pub fn wren_raylib_play_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.PlayMusicStream(@"0");
}

pub fn wren_raylib_is_music_stream_playing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsMusicStreamPlaying(@"0"));
}

pub fn wren_raylib_update_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.UpdateMusicStream(@"0");
}

pub fn wren_raylib_stop_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.StopMusicStream(@"0");
}

pub fn wren_raylib_pause_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.PauseMusicStream(@"0");
}

pub fn wren_raylib_resume_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    r.ResumeMusicStream(@"0");
}

pub fn wren_raylib_seek_music_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SeekMusicStream(@"0", @"1");
}

pub fn wren_raylib_set_music_volume(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetMusicVolume(@"0", @"1");
}

pub fn wren_raylib_set_music_pitch(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetMusicPitch(@"0", @"1");
}

pub fn wren_raylib_set_music_pan(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetMusicPan(@"0", @"1");
}

pub fn wren_raylib_get_music_time_length(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    wren.wrenSetSlotDouble(vm, 0, r.GetMusicTimeLength(@"0"));
}

pub fn wren_raylib_get_music_time_played(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Music = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Music = ptr_0.?.*;
    wren.wrenSetSlotDouble(vm, 0, r.GetMusicTimePlayed(@"0"));
}

pub fn wren_raylib_load_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.AudioStream));

    const ptr: *r.AudioStream = @alignCast(@ptrCast(foreign_ptr));
    ptr.* = r.LoadAudioStream(@"0", @"1", @"2");
}

pub fn wren_raylib_is_audio_stream_valid(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsAudioStreamValid(@"0"));
}

pub fn wren_raylib_unload_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    r.UnloadAudioStream(@"0");
}

pub fn wren_raylib_update_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    @panic("r.UpdateAudioStream is not supported yet");
    //const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    //const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    //const @"0": r.AudioStream = ptr_0.?.*;
    //const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    //const ptr_1: ?*r.const void = @alignCast(@ptrCast(foreign_1));
    //const @"1": r.const void = ptr_1.?.*;
    //const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    //r.UpdateAudioStream(@"0", @"1", @"2");
}

pub fn wren_raylib_is_audio_stream_processed(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsAudioStreamProcessed(@"0"));
}

pub fn wren_raylib_play_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    r.PlayAudioStream(@"0");
}

pub fn wren_raylib_pause_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    r.PauseAudioStream(@"0");
}

pub fn wren_raylib_resume_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    r.ResumeAudioStream(@"0");
}

pub fn wren_raylib_is_audio_stream_playing(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    wren.wrenSetSlotBool(vm, 0, r.IsAudioStreamPlaying(@"0"));
}

pub fn wren_raylib_stop_audio_stream(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    r.StopAudioStream(@"0");
}

pub fn wren_raylib_set_audio_stream_volume(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetAudioStreamVolume(@"0", @"1");
}

pub fn wren_raylib_set_audio_stream_pitch(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetAudioStreamPitch(@"0", @"1");
}

pub fn wren_raylib_set_audio_stream_pan(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const @"1" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, 2)));
    r.SetAudioStreamPan(@"0", @"1");
}

pub fn wren_raylib_set_audio_stream_buffer_size_default(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetAudioStreamBufferSizeDefault(@"0");
}

pub fn wren_raylib_set_audio_stream_callback(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.AudioCallback = @alignCast(@ptrCast(foreign_1));
    const @"1": r.AudioCallback = ptr_1.?.*;
    r.SetAudioStreamCallback(@"0", @"1");
}

pub fn wren_raylib_attach_audio_stream_processor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.AudioCallback = @alignCast(@ptrCast(foreign_1));
    const @"1": r.AudioCallback = ptr_1.?.*;
    r.AttachAudioStreamProcessor(@"0", @"1");
}

pub fn wren_raylib_detach_audio_stream_processor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioStream = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioStream = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.AudioCallback = @alignCast(@ptrCast(foreign_1));
    const @"1": r.AudioCallback = ptr_1.?.*;
    r.DetachAudioStreamProcessor(@"0", @"1");
}

pub fn wren_raylib_attach_audio_mixed_processor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioCallback = ptr_0.?.*;
    r.AttachAudioMixedProcessor(@"0");
}

pub fn wren_raylib_detach_audio_mixed_processor(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.AudioCallback = @alignCast(@ptrCast(foreign_0));
    const @"0": r.AudioCallback = ptr_0.?.*;
    r.DetachAudioMixedProcessor(@"0");
}

pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;
pub const WrenForeignClassAllocatorFn = fn (?*wren.WrenVM) callconv(.c) void;
pub const ForeignClass = struct { allocate: ?*const WrenForeignClassAllocatorFn };

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

    pub fn getTarget(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const camera_2d_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        wren.wrenEnsureSlots(vm, 1);
        wren.wrenGetVariable(vm, "raylib", "Vector2", 0);

        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector2));

        const tx: *r.Vector2 = @alignCast(@ptrCast(foreign_ptr));
        tx.* = camera_2d_ptr.?.*.target;
    }

    pub fn setTarget(vm: ?*wren.WrenVM) callconv(.c) void {
        var foreign = wren.wrenGetSlotForeign(vm, 0);
        const camera_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        foreign = wren.wrenGetSlotForeign(vm, 1);
        const target: ?*r.Vector2 = @alignCast(@ptrCast(foreign));

        camera_ptr.?.*.target = target.?.*;
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

    pub fn getZoom(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.zoom));
    }

    pub fn setZoom(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        const zoom = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.zoom = @floatCast(zoom);
    }

    pub fn getRotation(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, rectangle_ptr.?.*.rotation));
    }

    pub fn setRotation(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const rectangle_ptr: ?*r.Camera2D = @alignCast(@ptrCast(foreign));

        const rotation = wren.wrenGetSlotDouble(vm, 1);

        rectangle_ptr.?.*.rotation = @floatCast(rotation);
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

pub const Vector3 = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Vector3));

        const x = wren.wrenGetSlotDouble(vm, 1);
        const y = wren.wrenGetSlotDouble(vm, 2);
        const z = wren.wrenGetSlotDouble(vm, 3);

        const vector_ptr: *r.Vector3 = @alignCast(@ptrCast(foreign_ptr));
        vector_ptr.* = .{
            .x = @floatCast(x),
            .y = @floatCast(y),
            .z = @floatCast(z),
        };
    }

    pub fn get_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, vector.?.*.x));
    }

    pub fn set_x(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        const x = wren.wrenGetSlotDouble(vm, 1);

        vector.?.*.x = @floatCast(x);
    }

    pub fn get_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, vector_ptr.?.*.y));
    }

    pub fn set_y(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        const y = wren.wrenGetSlotDouble(vm, 1);

        vector_ptr.?.*.y = @floatCast(y);
    }

    pub fn get_z(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        wren.wrenSetSlotDouble(vm, 0, @as(f32, vector_ptr.?.*.z));
    }

    pub fn set_z(vm: ?*wren.WrenVM) callconv(.C) void {
        const foreign = wren.wrenGetSlotForeign(vm, 0);
        const vector_ptr: ?*r.Vector3 = @alignCast(@ptrCast(foreign));

        const z = wren.wrenGetSlotDouble(vm, 1);

        vector_ptr.?.*.z = @floatCast(z);
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

pub const Image = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Image));
        _ = foreign_ptr;
    }
};

pub const Font = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Font));
        _ = foreign_ptr;
    }
};

pub const Wave = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Wave));
        _ = foreign_ptr;
    }
};

pub const Sound = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.Sound));
        _ = foreign_ptr;
    }
};

pub const AudioStream = struct {
    pub fn allocate(vm: ?*wren.WrenVM) callconv(.c) void {
        const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.AudioStream));
        _ = foreign_ptr;
    }
};

pub fn wren_raylib_draw_text(vm: ?*wren.WrenVM) callconv(.C) void {
    const title = wren.wrenGetSlotString(vm, 1);
    const x: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const y: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const z: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 4));

    const foreign = wren.wrenGetSlotForeign(vm, 5);
    const color_ptr: ?*r.Color = @alignCast(@ptrCast(foreign));

    r.DrawText(title, x, y, z, color_ptr.?.*);
}

pub fn wren_load_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    std.debug.print("We are here\n", .{});
    //const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    //const height: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));

    //const target = r.LoadRenderTexture(width, height);

    //wren.wrenEnsureSlots(vm, 1);
    //wren.wrenGetVariable(vm, "raylib", "RenderTexture2D", 0);

    //const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.RenderTexture2D));

    //const render_texture_ptr: *r.RenderTexture2D = @alignCast(@ptrCast(foreign_ptr));
    //render_texture_ptr.* = target;
}

pub fn end_texture_mode(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = vm;
    r.EndTextureMode();
}

pub fn wren_unload_render_texture(vm: ?*wren.WrenVM) callconv(.C) void {
    const foreign = wren.wrenGetSlotForeign(vm, 1);
    const render_texture_ptr: ?*r.RenderTexture2D = @alignCast(@ptrCast(foreign));

    r.UnloadRenderTexture(render_texture_ptr.?.*);
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

pub const ForeignMethodBindings = std.StaticStringMap(?*const WrenForeignMethodFn).initComptime(.{
    .{ "raylib.Raylib.initWindow(_,_,_)", wren_raylib_init_window },
    .{ "raylib.Raylib.closeWindow()", wren_raylib_close_window },
    .{ "raylib.Raylib.windowShouldClose()", wren_raylib_window_should_close },
    .{ "raylib.Raylib.isWindowReady()", wren_raylib_is_window_ready },
    .{ "raylib.Raylib.isWindowFullscreen()", wren_raylib_is_window_fullscreen },
    .{ "raylib.Raylib.isWindowHidden()", wren_raylib_is_window_hidden },
    .{ "raylib.Raylib.isWindowMinimized()", wren_raylib_is_window_minimized },
    .{ "raylib.Raylib.isWindowMaximized()", wren_raylib_is_window_maximized },
    .{ "raylib.Raylib.isWindowFocused()", wren_raylib_is_window_focused },
    .{ "raylib.Raylib.isWindowResized()", wren_raylib_is_window_resized },
    .{ "raylib.Raylib.isWindowState(_)", wren_raylib_is_window_state },
    .{ "raylib.Raylib.setWindowState(_)", wren_raylib_set_window_state },
    .{ "raylib.Raylib.clearWindowState(_)", wren_raylib_clear_window_state },
    .{ "raylib.Raylib.toggleFullscreen()", wren_raylib_toggle_fullscreen },
    .{ "raylib.Raylib.toggleBorderlessWindowed()", wren_raylib_toggle_borderless_windowed },
    .{ "raylib.Raylib.maximizeWindow()", wren_raylib_maximize_window },
    .{ "raylib.Raylib.minimizeWindow()", wren_raylib_minimize_window },
    .{ "raylib.Raylib.restoreWindow()", wren_raylib_restore_window },
    .{ "raylib.Raylib.setWindowIcon(_)", wren_raylib_set_window_icon },
    .{ "raylib.Raylib.setWindowIcons(_,_)", wren_raylib_set_window_icons },
    .{ "raylib.Raylib.setWindowTitle(_)", wren_raylib_set_window_title },
    .{ "raylib.Raylib.setWindowPosition(_,_)", wren_raylib_set_window_position },
    .{ "raylib.Raylib.setWindowMonitor(_)", wren_raylib_set_window_monitor },
    .{ "raylib.Raylib.setWindowMinSize(_,_)", wren_raylib_set_window_min_size },
    .{ "raylib.Raylib.setWindowMaxSize(_,_)", wren_raylib_set_window_max_size },
    .{ "raylib.Raylib.setWindowSize(_,_)", wren_raylib_set_window_size },
    .{ "raylib.Raylib.setWindowOpacity(_)", wren_raylib_set_window_opacity },
    .{ "raylib.Raylib.setWindowFocused()", wren_raylib_set_window_focused },
    .{ "raylib.Raylib.getScreenWidth()", wren_raylib_get_screen_width },
    .{ "raylib.Raylib.getScreenHeight()", wren_raylib_get_screen_height },
    .{ "raylib.Raylib.getRenderWidth()", wren_raylib_get_render_width },
    .{ "raylib.Raylib.getRenderHeight()", wren_raylib_get_render_height },
    .{ "raylib.Raylib.getMonitorCount()", wren_raylib_get_monitor_count },
    .{ "raylib.Raylib.getCurrentMonitor()", wren_raylib_get_current_monitor },
    .{ "raylib.Raylib.getMonitorPosition(_)", wren_raylib_get_monitor_position },
    .{ "raylib.Raylib.getMonitorWidth(_)", wren_raylib_get_monitor_width },
    .{ "raylib.Raylib.getMonitorHeight(_)", wren_raylib_get_monitor_height },
    .{ "raylib.Raylib.getMonitorPhysicalWidth(_)", wren_raylib_get_monitor_physical_width },
    .{ "raylib.Raylib.getMonitorPhysicalHeight(_)", wren_raylib_get_monitor_physical_height },
    .{ "raylib.Raylib.getMonitorRefreshRate(_)", wren_raylib_get_monitor_refresh_rate },
    .{ "raylib.Raylib.getWindowPosition()", wren_raylib_get_window_position },
    .{ "raylib.Raylib.getWindowScaleDPI()", wren_raylib_get_window_scale_d_p_i },
    .{ "raylib.Raylib.getMonitorName(_)", wren_raylib_get_monitor_name },
    .{ "raylib.Raylib.setClipboardText(_)", wren_raylib_set_clipboard_text },
    .{ "raylib.Raylib.getClipboardText()", wren_raylib_get_clipboard_text },
    .{ "raylib.Raylib.getClipboardImage()", wren_raylib_get_clipboard_image },
    .{ "raylib.Raylib.enableEventWaiting()", wren_raylib_enable_event_waiting },
    .{ "raylib.Raylib.disableEventWaiting()", wren_raylib_disable_event_waiting },
    .{ "raylib.Raylib.showCursor()", wren_raylib_show_cursor },
    .{ "raylib.Raylib.hideCursor()", wren_raylib_hide_cursor },
    .{ "raylib.Raylib.isCursorHidden()", wren_raylib_is_cursor_hidden },
    .{ "raylib.Raylib.enableCursor()", wren_raylib_enable_cursor },
    .{ "raylib.Raylib.disableCursor()", wren_raylib_disable_cursor },
    .{ "raylib.Raylib.isCursorOnScreen()", wren_raylib_is_cursor_on_screen },
    .{ "raylib.Raylib.clearBackground(_)", wren_raylib_clear_background },
    .{ "raylib.Raylib.beginDrawing()", wren_raylib_begin_drawing },
    .{ "raylib.Raylib.endDrawing()", wren_raylib_end_drawing },
    .{ "raylib.Raylib.beginMode2D(_)", wren_raylib_begin_mode2_d },
    .{ "raylib.Raylib.endMode2D()", wren_raylib_end_mode2_d },
    .{ "raylib.Raylib.beginMode3D(_)", wren_raylib_begin_mode3_d },
    .{ "raylib.Raylib.endMode3D()", wren_raylib_end_mode3_d },
    .{ "raylib.Raylib.beginTextureMode(_)", wren_raylib_begin_texture_mode },
    .{ "raylib.Raylib.endTextureMode()", wren_raylib_end_texture_mode },
    .{ "raylib.Raylib.beginShaderMode(_)", wren_raylib_begin_shader_mode },
    .{ "raylib.Raylib.endShaderMode()", wren_raylib_end_shader_mode },
    .{ "raylib.Raylib.beginBlendMode(_)", wren_raylib_begin_blend_mode },
    .{ "raylib.Raylib.endBlendMode()", wren_raylib_end_blend_mode },
    .{ "raylib.Raylib.beginScissorMode(_,_,_,_)", wren_raylib_begin_scissor_mode },
    .{ "raylib.Raylib.endScissorMode()", wren_raylib_end_scissor_mode },
    .{ "raylib.Raylib.beginVrStereoMode(_)", wren_raylib_begin_vr_stereo_mode },
    .{ "raylib.Raylib.endVrStereoMode()", wren_raylib_end_vr_stereo_mode },
    .{ "raylib.Raylib.loadVrStereoConfig(_)", wren_raylib_load_vr_stereo_config },
    .{ "raylib.Raylib.unloadVrStereoConfig(_)", wren_raylib_unload_vr_stereo_config },
    .{ "raylib.Raylib.loadShader(_,_)", wren_raylib_load_shader },
    .{ "raylib.Raylib.loadShaderFromMemory(_,_)", wren_raylib_load_shader_from_memory },
    .{ "raylib.Raylib.isShaderValid(_)", wren_raylib_is_shader_valid },
    .{ "raylib.Raylib.getShaderLocation(_,_)", wren_raylib_get_shader_location },
    .{ "raylib.Raylib.getShaderLocationAttrib(_,_)", wren_raylib_get_shader_location_attrib },
    .{ "raylib.Raylib.setShaderValueMatrix(_,_,_)", wren_raylib_set_shader_value_matrix },
    .{ "raylib.Raylib.setShaderValueTexture(_,_,_)", wren_raylib_set_shader_value_texture },
    .{ "raylib.Raylib.unloadShader(_)", wren_raylib_unload_shader },
    .{ "raylib.Raylib.getScreenToWorldRay(_,_)", wren_raylib_get_screen_to_world_ray },
    .{ "raylib.Raylib.getScreenToWorldRayEx(_,_,_,_)", wren_raylib_get_screen_to_world_ray_ex },
    .{ "raylib.Raylib.getWorldToScreen(_,_)", wren_raylib_get_world_to_screen },
    .{ "raylib.Raylib.getWorldToScreenEx(_,_,_,_)", wren_raylib_get_world_to_screen_ex },
    .{ "raylib.Raylib.getWorldToScreen2D(_,_)", wren_raylib_get_world_to_screen2_d },
    .{ "raylib.Raylib.getScreenToWorld2D(_,_)", wren_raylib_get_screen_to_world2_d },
    .{ "raylib.Raylib.getCameraMatrix(_)", wren_raylib_get_camera_matrix },
    .{ "raylib.Raylib.getCameraMatrix2D(_)", wren_raylib_get_camera_matrix2_d },
    .{ "raylib.Raylib.setTargetFPS(_)", wren_raylib_set_target_f_p_s },
    .{ "raylib.Raylib.getFrameTime()", wren_raylib_get_frame_time },
    .{ "raylib.Raylib.getTime()", wren_raylib_get_time },
    .{ "raylib.Raylib.getFPS()", wren_raylib_get_f_p_s },
    .{ "raylib.Raylib.swapScreenBuffer()", wren_raylib_swap_screen_buffer },
    .{ "raylib.Raylib.pollInputEvents()", wren_raylib_poll_input_events },
    .{ "raylib.Raylib.waitTime(_)", wren_raylib_wait_time },
    .{ "raylib.Raylib.setRandomSeed(_)", wren_raylib_set_random_seed },
    .{ "raylib.Raylib.getRandomValue(_,_)", wren_raylib_get_random_value },
    .{ "raylib.Raylib.loadRandomSequence(_,_,_)", wren_raylib_load_random_sequence },
    .{ "raylib.Raylib.unloadRandomSequence(_)", wren_raylib_unload_random_sequence },
    .{ "raylib.Raylib.takeScreenshot(_)", wren_raylib_take_screenshot },
    .{ "raylib.Raylib.setConfigFlags(_)", wren_raylib_set_config_flags },
    .{ "raylib.Raylib.openURL(_)", wren_raylib_open_u_r_l },
    .{ "raylib.Raylib.setTraceLogLevel(_)", wren_raylib_set_trace_log_level },
    .{ "raylib.Raylib.memAlloc(_)", wren_raylib_mem_alloc },
    .{ "raylib.Raylib.setTraceLogCallback(_)", wren_raylib_set_trace_log_callback },
    .{ "raylib.Raylib.setLoadFileDataCallback(_)", wren_raylib_set_load_file_data_callback },
    .{ "raylib.Raylib.setSaveFileDataCallback(_)", wren_raylib_set_save_file_data_callback },
    .{ "raylib.Raylib.setLoadFileTextCallback(_)", wren_raylib_set_load_file_text_callback },
    .{ "raylib.Raylib.setSaveFileTextCallback(_)", wren_raylib_set_save_file_text_callback },
    .{ "raylib.Raylib.loadFileData(_,_)", wren_raylib_load_file_data },
    .{ "raylib.Raylib.unloadFileData(_)", wren_raylib_unload_file_data },
    .{ "raylib.Raylib.exportDataAsCode(_,_,_)", wren_raylib_export_data_as_code },
    .{ "raylib.Raylib.loadFileText(_)", wren_raylib_load_file_text },
    .{ "raylib.Raylib.unloadFileText(_)", wren_raylib_unload_file_text },
    .{ "raylib.Raylib.saveFileText(_,_)", wren_raylib_save_file_text },
    .{ "raylib.Raylib.fileExists(_)", wren_raylib_file_exists },
    .{ "raylib.Raylib.directoryExists(_)", wren_raylib_directory_exists },
    .{ "raylib.Raylib.isFileExtension(_,_)", wren_raylib_is_file_extension },
    .{ "raylib.Raylib.getFileLength(_)", wren_raylib_get_file_length },
    .{ "raylib.Raylib.getFileExtension(_)", wren_raylib_get_file_extension },
    .{ "raylib.Raylib.getFileName(_)", wren_raylib_get_file_name },
    .{ "raylib.Raylib.getFileNameWithoutExt(_)", wren_raylib_get_file_name_without_ext },
    .{ "raylib.Raylib.getDirectoryPath(_)", wren_raylib_get_directory_path },
    .{ "raylib.Raylib.getPrevDirectoryPath(_)", wren_raylib_get_prev_directory_path },
    .{ "raylib.Raylib.getWorkingDirectory()", wren_raylib_get_working_directory },
    .{ "raylib.Raylib.getApplicationDirectory()", wren_raylib_get_application_directory },
    .{ "raylib.Raylib.makeDirectory(_)", wren_raylib_make_directory },
    .{ "raylib.Raylib.changeDirectory(_)", wren_raylib_change_directory },
    .{ "raylib.Raylib.isPathFile(_)", wren_raylib_is_path_file },
    .{ "raylib.Raylib.isFileNameValid(_)", wren_raylib_is_file_name_valid },
    .{ "raylib.Raylib.loadDirectoryFiles(_)", wren_raylib_load_directory_files },
    .{ "raylib.Raylib.loadDirectoryFilesEx(_,_,_)", wren_raylib_load_directory_files_ex },
    .{ "raylib.Raylib.unloadDirectoryFiles(_)", wren_raylib_unload_directory_files },
    .{ "raylib.Raylib.isFileDropped()", wren_raylib_is_file_dropped },
    .{ "raylib.Raylib.loadDroppedFiles()", wren_raylib_load_dropped_files },
    .{ "raylib.Raylib.unloadDroppedFiles(_)", wren_raylib_unload_dropped_files },
    .{ "raylib.Raylib.getFileModTime(_)", wren_raylib_get_file_mod_time },
    .{ "raylib.Raylib.compressData(_,_,_)", wren_raylib_compress_data },
    .{ "raylib.Raylib.decompressData(_,_,_)", wren_raylib_decompress_data },
    .{ "raylib.Raylib.encodeDataBase64(_,_,_)", wren_raylib_encode_data_base64 },
    .{ "raylib.Raylib.decodeDataBase64(_,_)", wren_raylib_decode_data_base64 },
    .{ "raylib.Raylib.computeCRC32(_,_)", wren_raylib_compute_c_r_c32 },
    .{ "raylib.Raylib.computeMD5(_,_)", wren_raylib_compute_m_d5 },
    .{ "raylib.Raylib.computeSHA1(_,_)", wren_raylib_compute_s_h_a1 },
    .{ "raylib.Raylib.loadAutomationEventList(_)", wren_raylib_load_automation_event_list },
    .{ "raylib.Raylib.unloadAutomationEventList(_)", wren_raylib_unload_automation_event_list },
    .{ "raylib.Raylib.exportAutomationEventList(_,_)", wren_raylib_export_automation_event_list },
    .{ "raylib.Raylib.setAutomationEventList(_)", wren_raylib_set_automation_event_list },
    .{ "raylib.Raylib.setAutomationEventBaseFrame(_)", wren_raylib_set_automation_event_base_frame },
    .{ "raylib.Raylib.startAutomationEventRecording()", wren_raylib_start_automation_event_recording },
    .{ "raylib.Raylib.stopAutomationEventRecording()", wren_raylib_stop_automation_event_recording },
    .{ "raylib.Raylib.playAutomationEvent(_)", wren_raylib_play_automation_event },
    .{ "raylib.Raylib.isKeyPressed(_)", wren_raylib_is_key_pressed },
    .{ "raylib.Raylib.isKeyPressedRepeat(_)", wren_raylib_is_key_pressed_repeat },
    .{ "raylib.Raylib.isKeyDown(_)", wren_raylib_is_key_down },
    .{ "raylib.Raylib.isKeyReleased(_)", wren_raylib_is_key_released },
    .{ "raylib.Raylib.isKeyUp(_)", wren_raylib_is_key_up },
    .{ "raylib.Raylib.getKeyPressed()", wren_raylib_get_key_pressed },
    .{ "raylib.Raylib.getCharPressed()", wren_raylib_get_char_pressed },
    .{ "raylib.Raylib.setExitKey(_)", wren_raylib_set_exit_key },
    .{ "raylib.Raylib.isGamepadAvailable(_)", wren_raylib_is_gamepad_available },
    .{ "raylib.Raylib.getGamepadName(_)", wren_raylib_get_gamepad_name },
    .{ "raylib.Raylib.isGamepadButtonPressed(_,_)", wren_raylib_is_gamepad_button_pressed },
    .{ "raylib.Raylib.isGamepadButtonDown(_,_)", wren_raylib_is_gamepad_button_down },
    .{ "raylib.Raylib.isGamepadButtonReleased(_,_)", wren_raylib_is_gamepad_button_released },
    .{ "raylib.Raylib.isGamepadButtonUp(_,_)", wren_raylib_is_gamepad_button_up },
    .{ "raylib.Raylib.getGamepadButtonPressed()", wren_raylib_get_gamepad_button_pressed },
    .{ "raylib.Raylib.getGamepadAxisCount(_)", wren_raylib_get_gamepad_axis_count },
    .{ "raylib.Raylib.getGamepadAxisMovement(_,_)", wren_raylib_get_gamepad_axis_movement },
    .{ "raylib.Raylib.setGamepadMappings(_)", wren_raylib_set_gamepad_mappings },
    .{ "raylib.Raylib.setGamepadVibration(_,_,_,_)", wren_raylib_set_gamepad_vibration },
    .{ "raylib.Raylib.isMouseButtonPressed(_)", wren_raylib_is_mouse_button_pressed },
    .{ "raylib.Raylib.isMouseButtonDown(_)", wren_raylib_is_mouse_button_down },
    .{ "raylib.Raylib.isMouseButtonReleased(_)", wren_raylib_is_mouse_button_released },
    .{ "raylib.Raylib.isMouseButtonUp(_)", wren_raylib_is_mouse_button_up },
    .{ "raylib.Raylib.getMouseX()", wren_raylib_get_mouse_x },
    .{ "raylib.Raylib.getMouseY()", wren_raylib_get_mouse_y },
    .{ "raylib.Raylib.getMousePosition()", wren_raylib_get_mouse_position },
    .{ "raylib.Raylib.getMouseDelta()", wren_raylib_get_mouse_delta },
    .{ "raylib.Raylib.setMousePosition(_,_)", wren_raylib_set_mouse_position },
    .{ "raylib.Raylib.setMouseOffset(_,_)", wren_raylib_set_mouse_offset },
    .{ "raylib.Raylib.setMouseScale(_,_)", wren_raylib_set_mouse_scale },
    .{ "raylib.Raylib.getMouseWheelMove()", wren_raylib_get_mouse_wheel_move },
    .{ "raylib.Raylib.getMouseWheelMoveV()", wren_raylib_get_mouse_wheel_move_v },
    .{ "raylib.Raylib.setMouseCursor(_)", wren_raylib_set_mouse_cursor },
    .{ "raylib.Raylib.getTouchX()", wren_raylib_get_touch_x },
    .{ "raylib.Raylib.getTouchY()", wren_raylib_get_touch_y },
    .{ "raylib.Raylib.getTouchPosition(_)", wren_raylib_get_touch_position },
    .{ "raylib.Raylib.getTouchPointId(_)", wren_raylib_get_touch_point_id },
    .{ "raylib.Raylib.getTouchPointCount()", wren_raylib_get_touch_point_count },
    .{ "raylib.Raylib.setGesturesEnabled(_)", wren_raylib_set_gestures_enabled },
    .{ "raylib.Raylib.isGestureDetected(_)", wren_raylib_is_gesture_detected },
    .{ "raylib.Raylib.getGestureDetected()", wren_raylib_get_gesture_detected },
    .{ "raylib.Raylib.getGestureHoldDuration()", wren_raylib_get_gesture_hold_duration },
    .{ "raylib.Raylib.getGestureDragVector()", wren_raylib_get_gesture_drag_vector },
    .{ "raylib.Raylib.getGestureDragAngle()", wren_raylib_get_gesture_drag_angle },
    .{ "raylib.Raylib.getGesturePinchVector()", wren_raylib_get_gesture_pinch_vector },
    .{ "raylib.Raylib.getGesturePinchAngle()", wren_raylib_get_gesture_pinch_angle },
    .{ "raylib.Raylib.updateCamera(_,_)", wren_raylib_update_camera },
    .{ "raylib.Raylib.updateCameraPro(_,_,_,_)", wren_raylib_update_camera_pro },
    .{ "raylib.Raylib.drawPixel(_,_,_)", wren_raylib_draw_pixel },
    .{ "raylib.Raylib.drawPixelV(_,_)", wren_raylib_draw_pixel_v },
    .{ "raylib.Raylib.drawLine(_,_,_,_,_)", wren_raylib_draw_line },
    .{ "raylib.Raylib.drawLineV(_,_,_)", wren_raylib_draw_line_v },
    .{ "raylib.Raylib.drawLineEx(_,_,_,_)", wren_raylib_draw_line_ex },
    .{ "raylib.Raylib.drawLineStrip(_,_,_)", wren_raylib_draw_line_strip },
    .{ "raylib.Raylib.drawLineBezier(_,_,_,_)", wren_raylib_draw_line_bezier },
    .{ "raylib.Raylib.drawCircle(_,_,_,_)", wren_raylib_draw_circle },
    .{ "raylib.Raylib.drawCircleSector(_,_,_,_,_,_)", wren_raylib_draw_circle_sector },
    .{ "raylib.Raylib.drawCircleSectorLines(_,_,_,_,_,_)", wren_raylib_draw_circle_sector_lines },
    .{ "raylib.Raylib.drawCircleGradient(_,_,_,_,_)", wren_raylib_draw_circle_gradient },
    .{ "raylib.Raylib.drawCircleV(_,_,_)", wren_raylib_draw_circle_v },
    .{ "raylib.Raylib.drawCircleLines(_,_,_,_)", wren_raylib_draw_circle_lines },
    .{ "raylib.Raylib.drawCircleLinesV(_,_,_)", wren_raylib_draw_circle_lines_v },
    .{ "raylib.Raylib.drawEllipse(_,_,_,_,_)", wren_raylib_draw_ellipse },
    .{ "raylib.Raylib.drawEllipseLines(_,_,_,_,_)", wren_raylib_draw_ellipse_lines },
    .{ "raylib.Raylib.drawRing(_,_,_,_,_,_,_)", wren_raylib_draw_ring },
    .{ "raylib.Raylib.drawRingLines(_,_,_,_,_,_,_)", wren_raylib_draw_ring_lines },
    .{ "raylib.Raylib.drawRectangle(_,_,_,_,_)", wren_raylib_draw_rectangle },
    .{ "raylib.Raylib.drawRectangleV(_,_,_)", wren_raylib_draw_rectangle_v },
    .{ "raylib.Raylib.drawRectangleRec(_,_)", wren_raylib_draw_rectangle_rec },
    .{ "raylib.Raylib.drawRectanglePro(_,_,_,_)", wren_raylib_draw_rectangle_pro },
    .{ "raylib.Raylib.drawRectangleGradientV(_,_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_v },
    .{ "raylib.Raylib.drawRectangleGradientH(_,_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_h },
    .{ "raylib.Raylib.drawRectangleGradientEx(_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_ex },
    .{ "raylib.Raylib.drawRectangleLines(_,_,_,_,_)", wren_raylib_draw_rectangle_lines },
    .{ "raylib.Raylib.drawRectangleLinesEx(_,_,_)", wren_raylib_draw_rectangle_lines_ex },
    .{ "raylib.Raylib.drawRectangleRounded(_,_,_,_)", wren_raylib_draw_rectangle_rounded },
    .{ "raylib.Raylib.drawRectangleRoundedLines(_,_,_,_)", wren_raylib_draw_rectangle_rounded_lines },
    .{ "raylib.Raylib.drawRectangleRoundedLinesEx(_,_,_,_,_)", wren_raylib_draw_rectangle_rounded_lines_ex },
    .{ "raylib.Raylib.drawTriangle(_,_,_,_)", wren_raylib_draw_triangle },
    .{ "raylib.Raylib.drawTriangleLines(_,_,_,_)", wren_raylib_draw_triangle_lines },
    .{ "raylib.Raylib.drawTriangleFan(_,_,_)", wren_raylib_draw_triangle_fan },
    .{ "raylib.Raylib.drawTriangleStrip(_,_,_)", wren_raylib_draw_triangle_strip },
    .{ "raylib.Raylib.drawPoly(_,_,_,_,_)", wren_raylib_draw_poly },
    .{ "raylib.Raylib.drawPolyLines(_,_,_,_,_)", wren_raylib_draw_poly_lines },
    .{ "raylib.Raylib.drawPolyLinesEx(_,_,_,_,_,_)", wren_raylib_draw_poly_lines_ex },
    .{ "raylib.Raylib.drawSplineLinear(_,_,_,_)", wren_raylib_draw_spline_linear },
    .{ "raylib.Raylib.drawSplineBasis(_,_,_,_)", wren_raylib_draw_spline_basis },
    .{ "raylib.Raylib.drawSplineCatmullRom(_,_,_,_)", wren_raylib_draw_spline_catmull_rom },
    .{ "raylib.Raylib.drawSplineBezierQuadratic(_,_,_,_)", wren_raylib_draw_spline_bezier_quadratic },
    .{ "raylib.Raylib.drawSplineBezierCubic(_,_,_,_)", wren_raylib_draw_spline_bezier_cubic },
    .{ "raylib.Raylib.drawSplineSegmentLinear(_,_,_,_)", wren_raylib_draw_spline_segment_linear },
    .{ "raylib.Raylib.drawSplineSegmentBasis(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_basis },
    .{ "raylib.Raylib.drawSplineSegmentCatmullRom(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_catmull_rom },
    .{ "raylib.Raylib.drawSplineSegmentBezierQuadratic(_,_,_,_,_)", wren_raylib_draw_spline_segment_bezier_quadratic },
    .{ "raylib.Raylib.drawSplineSegmentBezierCubic(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_bezier_cubic },
    .{ "raylib.Raylib.getSplinePointLinear(_,_,_)", wren_raylib_get_spline_point_linear },
    .{ "raylib.Raylib.getSplinePointBasis(_,_,_,_,_)", wren_raylib_get_spline_point_basis },
    .{ "raylib.Raylib.getSplinePointCatmullRom(_,_,_,_,_)", wren_raylib_get_spline_point_catmull_rom },
    .{ "raylib.Raylib.getSplinePointBezierQuad(_,_,_,_)", wren_raylib_get_spline_point_bezier_quad },
    .{ "raylib.Raylib.getSplinePointBezierCubic(_,_,_,_,_)", wren_raylib_get_spline_point_bezier_cubic },
    .{ "raylib.Raylib.checkCollisionRecs(_,_)", wren_raylib_check_collision_recs },
    .{ "raylib.Raylib.checkCollisionCircles(_,_,_,_)", wren_raylib_check_collision_circles },
    .{ "raylib.Raylib.checkCollisionCircleRec(_,_,_)", wren_raylib_check_collision_circle_rec },
    .{ "raylib.Raylib.checkCollisionCircleLine(_,_,_,_)", wren_raylib_check_collision_circle_line },
    .{ "raylib.Raylib.checkCollisionPointRec(_,_)", wren_raylib_check_collision_point_rec },
    .{ "raylib.Raylib.checkCollisionPointCircle(_,_,_)", wren_raylib_check_collision_point_circle },
    .{ "raylib.Raylib.checkCollisionPointTriangle(_,_,_,_)", wren_raylib_check_collision_point_triangle },
    .{ "raylib.Raylib.checkCollisionPointLine(_,_,_,_)", wren_raylib_check_collision_point_line },
    .{ "raylib.Raylib.checkCollisionPointPoly(_,_,_)", wren_raylib_check_collision_point_poly },
    .{ "raylib.Raylib.checkCollisionLines(_,_,_,_,_)", wren_raylib_check_collision_lines },
    .{ "raylib.Raylib.getCollisionRec(_,_)", wren_raylib_get_collision_rec },
    .{ "raylib.Raylib.setShapesTexture(_,_)", wren_raylib_set_shapes_texture },
    .{ "raylib.Raylib.getShapesTexture()", wren_raylib_get_shapes_texture },
    .{ "raylib.Raylib.getShapesTextureRectangle()", wren_raylib_get_shapes_texture_rectangle },
    .{ "raylib.Raylib.loadImage(_)", wren_raylib_load_image },
    .{ "raylib.Raylib.loadImageRaw(_,_,_,_,_)", wren_raylib_load_image_raw },
    .{ "raylib.Raylib.loadImageAnim(_,_)", wren_raylib_load_image_anim },
    .{ "raylib.Raylib.loadImageAnimFromMemory(_,_,_,_)", wren_raylib_load_image_anim_from_memory },
    .{ "raylib.Raylib.loadImageFromMemory(_,_,_)", wren_raylib_load_image_from_memory },
    .{ "raylib.Raylib.loadImageFromTexture(_)", wren_raylib_load_image_from_texture },
    .{ "raylib.Raylib.loadImageFromScreen()", wren_raylib_load_image_from_screen },
    .{ "raylib.Raylib.isImageValid(_)", wren_raylib_is_image_valid },
    .{ "raylib.Raylib.unloadImage(_)", wren_raylib_unload_image },
    .{ "raylib.Raylib.exportImage(_,_)", wren_raylib_export_image },
    .{ "raylib.Raylib.exportImageToMemory(_,_,_)", wren_raylib_export_image_to_memory },
    .{ "raylib.Raylib.exportImageAsCode(_,_)", wren_raylib_export_image_as_code },
    .{ "raylib.Raylib.genImageColor(_,_,_)", wren_raylib_gen_image_color },
    .{ "raylib.Raylib.genImageGradientLinear(_,_,_,_,_)", wren_raylib_gen_image_gradient_linear },
    .{ "raylib.Raylib.genImageGradientRadial(_,_,_,_,_)", wren_raylib_gen_image_gradient_radial },
    .{ "raylib.Raylib.genImageGradientSquare(_,_,_,_,_)", wren_raylib_gen_image_gradient_square },
    .{ "raylib.Raylib.genImageChecked(_,_,_,_,_,_)", wren_raylib_gen_image_checked },
    .{ "raylib.Raylib.genImageWhiteNoise(_,_,_)", wren_raylib_gen_image_white_noise },
    .{ "raylib.Raylib.genImagePerlinNoise(_,_,_,_,_)", wren_raylib_gen_image_perlin_noise },
    .{ "raylib.Raylib.genImageCellular(_,_,_)", wren_raylib_gen_image_cellular },
    .{ "raylib.Raylib.genImageText(_,_,_)", wren_raylib_gen_image_text },
    .{ "raylib.Raylib.imageCopy(_)", wren_raylib_image_copy },
    .{ "raylib.Raylib.imageFromImage(_,_)", wren_raylib_image_from_image },
    .{ "raylib.Raylib.imageFromChannel(_,_)", wren_raylib_image_from_channel },
    .{ "raylib.Raylib.imageText(_,_,_)", wren_raylib_image_text },
    .{ "raylib.Raylib.imageTextEx(_,_,_,_,_)", wren_raylib_image_text_ex },
    .{ "raylib.Raylib.imageFormat(_,_)", wren_raylib_image_format },
    .{ "raylib.Raylib.imageToPOT(_,_)", wren_raylib_image_to_p_o_t },
    .{ "raylib.Raylib.imageCrop(_,_)", wren_raylib_image_crop },
    .{ "raylib.Raylib.imageAlphaCrop(_,_)", wren_raylib_image_alpha_crop },
    .{ "raylib.Raylib.imageAlphaClear(_,_,_)", wren_raylib_image_alpha_clear },
    .{ "raylib.Raylib.imageAlphaMask(_,_)", wren_raylib_image_alpha_mask },
    .{ "raylib.Raylib.imageAlphaPremultiply(_)", wren_raylib_image_alpha_premultiply },
    .{ "raylib.Raylib.imageBlurGaussian(_,_)", wren_raylib_image_blur_gaussian },
    .{ "raylib.Raylib.imageKernelConvolution(_,_,_)", wren_raylib_image_kernel_convolution },
    .{ "raylib.Raylib.imageResize(_,_,_)", wren_raylib_image_resize },
    .{ "raylib.Raylib.imageResizeNN(_,_,_)", wren_raylib_image_resize_n_n },
    .{ "raylib.Raylib.imageResizeCanvas(_,_,_,_,_,_)", wren_raylib_image_resize_canvas },
    .{ "raylib.Raylib.imageMipmaps(_)", wren_raylib_image_mipmaps },
    .{ "raylib.Raylib.imageDither(_,_,_,_,_)", wren_raylib_image_dither },
    .{ "raylib.Raylib.imageFlipVertical(_)", wren_raylib_image_flip_vertical },
    .{ "raylib.Raylib.imageFlipHorizontal(_)", wren_raylib_image_flip_horizontal },
    .{ "raylib.Raylib.imageRotate(_,_)", wren_raylib_image_rotate },
    .{ "raylib.Raylib.imageRotateCW(_)", wren_raylib_image_rotate_c_w },
    .{ "raylib.Raylib.imageRotateCCW(_)", wren_raylib_image_rotate_c_c_w },
    .{ "raylib.Raylib.imageColorTint(_,_)", wren_raylib_image_color_tint },
    .{ "raylib.Raylib.imageColorInvert(_)", wren_raylib_image_color_invert },
    .{ "raylib.Raylib.imageColorGrayscale(_)", wren_raylib_image_color_grayscale },
    .{ "raylib.Raylib.imageColorContrast(_,_)", wren_raylib_image_color_contrast },
    .{ "raylib.Raylib.imageColorBrightness(_,_)", wren_raylib_image_color_brightness },
    .{ "raylib.Raylib.imageColorReplace(_,_,_)", wren_raylib_image_color_replace },
    .{ "raylib.Raylib.loadImageColors(_)", wren_raylib_load_image_colors },
    .{ "raylib.Raylib.loadImagePalette(_,_,_)", wren_raylib_load_image_palette },
    .{ "raylib.Raylib.unloadImageColors(_)", wren_raylib_unload_image_colors },
    .{ "raylib.Raylib.unloadImagePalette(_)", wren_raylib_unload_image_palette },
    .{ "raylib.Raylib.getImageAlphaBorder(_,_)", wren_raylib_get_image_alpha_border },
    .{ "raylib.Raylib.getImageColor(_,_,_)", wren_raylib_get_image_color },
    .{ "raylib.Raylib.imageClearBackground(_,_)", wren_raylib_image_clear_background },
    .{ "raylib.Raylib.imageDrawPixel(_,_,_,_)", wren_raylib_image_draw_pixel },
    .{ "raylib.Raylib.imageDrawPixelV(_,_,_)", wren_raylib_image_draw_pixel_v },
    .{ "raylib.Raylib.imageDrawLine(_,_,_,_,_,_)", wren_raylib_image_draw_line },
    .{ "raylib.Raylib.imageDrawLineV(_,_,_,_)", wren_raylib_image_draw_line_v },
    .{ "raylib.Raylib.imageDrawLineEx(_,_,_,_,_)", wren_raylib_image_draw_line_ex },
    .{ "raylib.Raylib.imageDrawCircle(_,_,_,_,_)", wren_raylib_image_draw_circle },
    .{ "raylib.Raylib.imageDrawCircleV(_,_,_,_)", wren_raylib_image_draw_circle_v },
    .{ "raylib.Raylib.imageDrawCircleLines(_,_,_,_,_)", wren_raylib_image_draw_circle_lines },
    .{ "raylib.Raylib.imageDrawCircleLinesV(_,_,_,_)", wren_raylib_image_draw_circle_lines_v },
    .{ "raylib.Raylib.imageDrawRectangle(_,_,_,_,_,_)", wren_raylib_image_draw_rectangle },
    .{ "raylib.Raylib.imageDrawRectangleV(_,_,_,_)", wren_raylib_image_draw_rectangle_v },
    .{ "raylib.Raylib.imageDrawRectangleRec(_,_,_)", wren_raylib_image_draw_rectangle_rec },
    .{ "raylib.Raylib.imageDrawRectangleLines(_,_,_,_)", wren_raylib_image_draw_rectangle_lines },
    .{ "raylib.Raylib.imageDrawTriangle(_,_,_,_,_)", wren_raylib_image_draw_triangle },
    .{ "raylib.Raylib.imageDrawTriangleEx(_,_,_,_,_,_,_)", wren_raylib_image_draw_triangle_ex },
    .{ "raylib.Raylib.imageDrawTriangleLines(_,_,_,_,_)", wren_raylib_image_draw_triangle_lines },
    .{ "raylib.Raylib.imageDrawTriangleFan(_,_,_,_)", wren_raylib_image_draw_triangle_fan },
    .{ "raylib.Raylib.imageDrawTriangleStrip(_,_,_,_)", wren_raylib_image_draw_triangle_strip },
    .{ "raylib.Raylib.imageDraw(_,_,_,_,_)", wren_raylib_image_draw },
    .{ "raylib.Raylib.imageDrawText(_,_,_,_,_,_)", wren_raylib_image_draw_text },
    .{ "raylib.Raylib.imageDrawTextEx(_,_,_,_,_,_,_)", wren_raylib_image_draw_text_ex },
    .{ "raylib.Raylib.loadTexture(_)", wren_raylib_load_texture },
    .{ "raylib.Raylib.loadTextureFromImage(_)", wren_raylib_load_texture_from_image },
    .{ "raylib.Raylib.loadTextureCubemap(_,_)", wren_raylib_load_texture_cubemap },
    .{ "raylib.Raylib.loadRenderTexture(_,_)", wren_raylib_load_render_texture },
    .{ "raylib.Raylib.isTextureValid(_)", wren_raylib_is_texture_valid },
    .{ "raylib.Raylib.unloadTexture(_)", wren_raylib_unload_texture },
    .{ "raylib.Raylib.isRenderTextureValid(_)", wren_raylib_is_render_texture_valid },
    .{ "raylib.Raylib.unloadRenderTexture(_)", wren_raylib_unload_render_texture },
    .{ "raylib.Raylib.updateTexture(_,_)", wren_raylib_update_texture },
    .{ "raylib.Raylib.updateTextureRec(_,_,_)", wren_raylib_update_texture_rec },
    .{ "raylib.Raylib.genTextureMipmaps(_)", wren_raylib_gen_texture_mipmaps },
    .{ "raylib.Raylib.setTextureFilter(_,_)", wren_raylib_set_texture_filter },
    .{ "raylib.Raylib.setTextureWrap(_,_)", wren_raylib_set_texture_wrap },
    .{ "raylib.Raylib.drawTexture(_,_,_,_)", wren_raylib_draw_texture },
    .{ "raylib.Raylib.drawTextureV(_,_,_)", wren_raylib_draw_texture_v },
    .{ "raylib.Raylib.drawTextureEx(_,_,_,_,_)", wren_raylib_draw_texture_ex },
    .{ "raylib.Raylib.drawTextureRec(_,_,_,_)", wren_raylib_draw_texture_rec },
    .{ "raylib.Raylib.drawTexturePro(_,_,_,_,_,_)", wren_raylib_draw_texture_pro },
    .{ "raylib.Raylib.drawTextureNPatch(_,_,_,_,_,_)", wren_raylib_draw_texture_n_patch },
    .{ "raylib.Raylib.colorIsEqual(_,_)", wren_raylib_color_is_equal },
    .{ "raylib.Raylib.fade(_,_)", wren_raylib_fade },
    .{ "raylib.Raylib.colorToInt(_)", wren_raylib_color_to_int },
    .{ "raylib.Raylib.colorNormalize(_)", wren_raylib_color_normalize },
    .{ "raylib.Raylib.colorFromNormalized(_)", wren_raylib_color_from_normalized },
    .{ "raylib.Raylib.colorToHSV(_)", wren_raylib_color_to_h_s_v },
    .{ "raylib.Raylib.colorFromHSV(_,_,_)", wren_raylib_color_from_h_s_v },
    .{ "raylib.Raylib.colorTint(_,_)", wren_raylib_color_tint },
    .{ "raylib.Raylib.colorBrightness(_,_)", wren_raylib_color_brightness },
    .{ "raylib.Raylib.colorContrast(_,_)", wren_raylib_color_contrast },
    .{ "raylib.Raylib.colorAlpha(_,_)", wren_raylib_color_alpha },
    .{ "raylib.Raylib.colorAlphaBlend(_,_,_)", wren_raylib_color_alpha_blend },
    .{ "raylib.Raylib.colorLerp(_,_,_)", wren_raylib_color_lerp },
    .{ "raylib.Raylib.getColor(_)", wren_raylib_get_color },
    .{ "raylib.Raylib.getPixelColor(_,_)", wren_raylib_get_pixel_color },
    .{ "raylib.Raylib.setPixelColor(_,_,_)", wren_raylib_set_pixel_color },
    .{ "raylib.Raylib.getPixelDataSize(_,_,_)", wren_raylib_get_pixel_data_size },

    .{ "raylib.RenderTexture2D.texture", RaylibBindings.RenderTexture2D.texture },
    .{ "raylib.Texture2D.width", RaylibBindings.Texture2D.width },
    .{ "raylib.Texture2D.height", RaylibBindings.Texture2D.height },
    .{ "raylib.Texture2D.unloadTexture()", RaylibBindings.Texture2D.unloadTexture },
    .{ "raylib.Texture2D.loadTexture(_)", RaylibBindings.Texture2D.loadTexture },
    .{ "raylib.Camera2D.beginMode2D()", RaylibBindings.Camera2D.beginMode2D },
    .{ "raylib.Camera2D.endMode2D()", RaylibBindings.Camera2D.endMode2D },
    .{ "raylib.Camera2D.target", RaylibBindings.Camera2D.getTarget },
    .{ "raylib.Camera2D.target=(_)", RaylibBindings.Camera2D.setTarget },
    .{ "raylib.Camera2D.rotation", RaylibBindings.Camera2D.getRotation },
    .{ "raylib.Camera2D.rotation=(_)", RaylibBindings.Camera2D.setRotation },
    .{ "raylib.Camera2D.zoom", RaylibBindings.Camera2D.getZoom },
    .{ "raylib.Camera2D.zoom=(_)", RaylibBindings.Camera2D.setZoom },
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
    .{ "raylib.Vector3.x", RaylibBindings.Vector3.get_x },
    .{ "raylib.Vector3.x=(_)", RaylibBindings.Vector3.set_x },
    .{ "raylib.Vector3.y", RaylibBindings.Vector3.get_y },
    .{ "raylib.Vector3.y=(_)", RaylibBindings.Vector3.set_y },
    .{ "raylib.Vector3.z", RaylibBindings.Vector3.get_z },
    .{ "raylib.Vector3.z=(_)", RaylibBindings.Vector3.set_z },
    .{ "math.Math.min(_,_)", MathBindings.min },
    .{ "math.Math.max(_,_)", MathBindings.max },
    .{ "math.Math.sin(_)", MathBindings.sin },
    .{ "math.Math.cos(_)", MathBindings.cos },
    .{ "math.Math.pow(_,_)", MathBindings.pow },
    .{ "math.Math.exp(_)", MathBindings.exp },
    .{ "math.Math.log(_)", MathBindings.log },
    .{ "math.Math.exp2(_)", MathBindings.exp2 },
    .{ "math.Math.log2(_)", MathBindings.log2 },
    .{ "math.Math.log10(_)", MathBindings.log10 },
    .{ "math.Math.sqrt(_)", MathBindings.sqrt },
    .{ "math.Math.floor(_)", MathBindings.floor },
    .{ "math.Math.ceil(_)", MathBindings.ceil },
    .{ "math.Math.round(_)", MathBindings.round },
    .{ "math.Math.tan(_)", MathBindings.tan },
    // Manually added
    //.{ "raylib.Raylib.loadRenderTexture(_,_)", wren_load_render_texture },
    .{ "raylib.Raylib.drawText(_,_,_,_,_)", wren_raylib_draw_text },
    .{ "raylib.Raylib.drawTexturePro(_,_,_,_,_,_)", draw_texture_pro },
    .{ "raylib.Raylib.endTextureMode(_)", end_texture_mode },
    .{ "raylib.Raylib.unloadRenderTexture(_)", wren_unload_render_texture },
    .{ "raylib.Raylib.getFontDefault()", wren_raylib_get_font_default },
    .{ "raylib.Raylib.loadFont(_)", wren_raylib_load_font },
    .{ "raylib.Raylib.loadFontEx(_,_,_,_)", wren_raylib_load_font_ex },
    .{ "raylib.Raylib.loadFontFromImage(_,_,_)", wren_raylib_load_font_from_image },
    .{ "raylib.Raylib.loadFontFromMemory(_,_,_,_,_,_)", wren_raylib_load_font_from_memory },
    .{ "raylib.Raylib.isFontValid(_)", wren_raylib_is_font_valid },
    .{ "raylib.Raylib.loadFontData(_,_,_,_,_,_)", wren_raylib_load_font_data },
    .{ "raylib.Raylib.genImageFontAtlas(_,_,_,_,_,_)", wren_raylib_gen_image_font_atlas },
    .{ "raylib.Raylib.unloadFontData(_,_)", wren_raylib_unload_font_data },
    .{ "raylib.Raylib.unloadFont(_)", wren_raylib_unload_font },
    .{ "raylib.Raylib.exportFontAsCode(_,_)", wren_raylib_export_font_as_code },
    .{ "raylib.Raylib.drawFPS(_,_)", wren_raylib_draw_f_p_s },
    .{ "raylib.Raylib.drawText(_,_,_,_,_)", wren_raylib_draw_text },
    .{ "raylib.Raylib.drawTextEx(_,_,_,_,_,_)", wren_raylib_draw_text_ex },
    .{ "raylib.Raylib.drawTextPro(_,_,_,_,_,_,_,_)", wren_raylib_draw_text_pro },
    .{ "raylib.Raylib.drawTextCodepoint(_,_,_,_,_)", wren_raylib_draw_text_codepoint },
    .{ "raylib.Raylib.drawTextCodepoints(_,_,_,_,_,_,_)", wren_raylib_draw_text_codepoints },
    .{ "raylib.Raylib.setTextLineSpacing(_)", wren_raylib_set_text_line_spacing },
    .{ "raylib.Raylib.measureText(_,_)", wren_raylib_measure_text },
    .{ "raylib.Raylib.measureTextEx(_,_,_,_)", wren_raylib_measure_text_ex },
    .{ "raylib.Raylib.getGlyphIndex(_,_)", wren_raylib_get_glyph_index },
    .{ "raylib.Raylib.getGlyphInfo(_,_)", wren_raylib_get_glyph_info },
    .{ "raylib.Raylib.getGlyphAtlasRec(_,_)", wren_raylib_get_glyph_atlas_rec },
    .{ "raylib.Raylib.loadUTF8(_,_)", wren_raylib_load_u_t_f8 },
    .{ "raylib.Raylib.unloadUTF8(_)", wren_raylib_unload_u_t_f8 },
    .{ "raylib.Raylib.loadCodepoints(_,_)", wren_raylib_load_codepoints },
    .{ "raylib.Raylib.unloadCodepoints(_)", wren_raylib_unload_codepoints },
    .{ "raylib.Raylib.getCodepointCount(_)", wren_raylib_get_codepoint_count },
    .{ "raylib.Raylib.getCodepoint(_,_)", wren_raylib_get_codepoint },
    .{ "raylib.Raylib.getCodepointNext(_,_)", wren_raylib_get_codepoint_next },
    .{ "raylib.Raylib.getCodepointPrevious(_,_)", wren_raylib_get_codepoint_previous },
    .{ "raylib.Raylib.codepointToUTF8(_,_)", wren_raylib_codepoint_to_u_t_f8 },
    .{ "raylib.Raylib.textCopy(_,_)", wren_raylib_text_copy },
    .{ "raylib.Raylib.textIsEqual(_,_)", wren_raylib_text_is_equal },
    .{ "raylib.Raylib.textLength(_)", wren_raylib_text_length },
    .{ "raylib.Raylib.textFormat(_,_)", wren_raylib_text_format },
    .{ "raylib.Raylib.textSubtext(_,_,_)", wren_raylib_text_subtext },
    .{ "raylib.Raylib.textReplace(_,_,_)", wren_raylib_text_replace },
    .{ "raylib.Raylib.textInsert(_,_,_)", wren_raylib_text_insert },
    .{ "raylib.Raylib.textJoin(_,_,_)", wren_raylib_text_join },
    .{ "raylib.Raylib.textSplit(_,_,_)", wren_raylib_text_split },
    .{ "raylib.Raylib.textAppend(_,_,_)", wren_raylib_text_append },
    .{ "raylib.Raylib.textFindIndex(_,_)", wren_raylib_text_find_index },
    .{ "raylib.Raylib.textToUpper(_)", wren_raylib_text_to_upper },
    .{ "raylib.Raylib.textToLower(_)", wren_raylib_text_to_lower },
    .{ "raylib.Raylib.textToPascal(_)", wren_raylib_text_to_pascal },
    .{ "raylib.Raylib.textToSnake(_)", wren_raylib_text_to_snake },
    .{ "raylib.Raylib.textToCamel(_)", wren_raylib_text_to_camel },
    .{ "raylib.Raylib.textToInteger(_)", wren_raylib_text_to_integer },
    .{ "raylib.Raylib.textToFloat(_)", wren_raylib_text_to_float },
    .{ "raylib.Raylib.drawLine3D(_,_,_)", wren_raylib_draw_line3_d },
    .{ "raylib.Raylib.drawPoint3D(_,_)", wren_raylib_draw_point3_d },
    .{ "raylib.Raylib.drawCircle3D(_,_,_,_,_)", wren_raylib_draw_circle3_d },
    .{ "raylib.Raylib.drawTriangle3D(_,_,_,_)", wren_raylib_draw_triangle3_d },
    .{ "raylib.Raylib.drawTriangleStrip3D(_,_,_)", wren_raylib_draw_triangle_strip3_d },
    .{ "raylib.Raylib.drawCube(_,_,_,_,_)", wren_raylib_draw_cube },
    .{ "raylib.Raylib.drawCubeV(_,_,_)", wren_raylib_draw_cube_v },
    .{ "raylib.Raylib.drawCubeWires(_,_,_,_,_)", wren_raylib_draw_cube_wires },
    .{ "raylib.Raylib.drawCubeWiresV(_,_,_)", wren_raylib_draw_cube_wires_v },
    .{ "raylib.Raylib.drawSphere(_,_,_)", wren_raylib_draw_sphere },
    .{ "raylib.Raylib.drawSphereEx(_,_,_,_,_)", wren_raylib_draw_sphere_ex },
    .{ "raylib.Raylib.drawSphereWires(_,_,_,_,_)", wren_raylib_draw_sphere_wires },
    .{ "raylib.Raylib.drawCylinder(_,_,_,_,_,_)", wren_raylib_draw_cylinder },
    .{ "raylib.Raylib.drawCylinderEx(_,_,_,_,_,_)", wren_raylib_draw_cylinder_ex },
    .{ "raylib.Raylib.drawCylinderWires(_,_,_,_,_,_)", wren_raylib_draw_cylinder_wires },
    .{ "raylib.Raylib.drawCylinderWiresEx(_,_,_,_,_,_)", wren_raylib_draw_cylinder_wires_ex },
    .{ "raylib.Raylib.drawCapsule(_,_,_,_,_,_)", wren_raylib_draw_capsule },
    .{ "raylib.Raylib.drawCapsuleWires(_,_,_,_,_,_)", wren_raylib_draw_capsule_wires },
    .{ "raylib.Raylib.drawPlane(_,_,_)", wren_raylib_draw_plane },
    .{ "raylib.Raylib.drawRay(_,_)", wren_raylib_draw_ray },
    .{ "raylib.Raylib.drawGrid(_,_)", wren_raylib_draw_grid },
    .{ "raylib.Raylib.loadModel(_)", wren_raylib_load_model },
    .{ "raylib.Raylib.loadModelFromMesh(_)", wren_raylib_load_model_from_mesh },
    .{ "raylib.Raylib.isModelValid(_)", wren_raylib_is_model_valid },
    .{ "raylib.Raylib.unloadModel(_)", wren_raylib_unload_model },
    .{ "raylib.Raylib.getModelBoundingBox(_)", wren_raylib_get_model_bounding_box },
    .{ "raylib.Raylib.drawModel(_,_,_,_)", wren_raylib_draw_model },
    .{ "raylib.Raylib.drawModelEx(_,_,_,_,_,_)", wren_raylib_draw_model_ex },
    .{ "raylib.Raylib.drawModelWires(_,_,_,_)", wren_raylib_draw_model_wires },
    .{ "raylib.Raylib.drawModelWiresEx(_,_,_,_,_,_)", wren_raylib_draw_model_wires_ex },
    .{ "raylib.Raylib.drawModelPoints(_,_,_,_)", wren_raylib_draw_model_points },
    .{ "raylib.Raylib.drawModelPointsEx(_,_,_,_,_,_)", wren_raylib_draw_model_points_ex },
    .{ "raylib.Raylib.drawBoundingBox(_,_)", wren_raylib_draw_bounding_box },
    .{ "raylib.Raylib.drawBillboard(_,_,_,_,_)", wren_raylib_draw_billboard },
    .{ "raylib.Raylib.drawBillboardRec(_,_,_,_,_,_)", wren_raylib_draw_billboard_rec },
    .{ "raylib.Raylib.drawBillboardPro(_,_,_,_,_,_,_,_,_)", wren_raylib_draw_billboard_pro },
    .{ "raylib.Raylib.uploadMesh(_,_)", wren_raylib_upload_mesh },
    .{ "raylib.Raylib.updateMeshBuffer(_,_,_,_,_)", wren_raylib_update_mesh_buffer },
    .{ "raylib.Raylib.unloadMesh(_)", wren_raylib_unload_mesh },
    .{ "raylib.Raylib.drawMesh(_,_,_)", wren_raylib_draw_mesh },
    .{ "raylib.Raylib.drawMeshInstanced(_,_,_,_)", wren_raylib_draw_mesh_instanced },
    .{ "raylib.Raylib.getMeshBoundingBox(_)", wren_raylib_get_mesh_bounding_box },
    .{ "raylib.Raylib.genMeshTangents(_)", wren_raylib_gen_mesh_tangents },
    .{ "raylib.Raylib.exportMesh(_,_)", wren_raylib_export_mesh },
    .{ "raylib.Raylib.exportMeshAsCode(_,_)", wren_raylib_export_mesh_as_code },
    .{ "raylib.Raylib.genMeshPoly(_,_)", wren_raylib_gen_mesh_poly },
    .{ "raylib.Raylib.genMeshPlane(_,_,_,_)", wren_raylib_gen_mesh_plane },
    .{ "raylib.Raylib.genMeshCube(_,_,_)", wren_raylib_gen_mesh_cube },
    .{ "raylib.Raylib.genMeshSphere(_,_,_)", wren_raylib_gen_mesh_sphere },
    .{ "raylib.Raylib.genMeshHemiSphere(_,_,_)", wren_raylib_gen_mesh_hemi_sphere },
    .{ "raylib.Raylib.genMeshCylinder(_,_,_)", wren_raylib_gen_mesh_cylinder },
    .{ "raylib.Raylib.genMeshCone(_,_,_)", wren_raylib_gen_mesh_cone },
    .{ "raylib.Raylib.genMeshTorus(_,_,_,_)", wren_raylib_gen_mesh_torus },
    .{ "raylib.Raylib.genMeshKnot(_,_,_,_)", wren_raylib_gen_mesh_knot },
    .{ "raylib.Raylib.genMeshHeightmap(_,_)", wren_raylib_gen_mesh_heightmap },
    .{ "raylib.Raylib.genMeshCubicmap(_,_)", wren_raylib_gen_mesh_cubicmap },
    .{ "raylib.Raylib.loadMaterials(_,_)", wren_raylib_load_materials },
    .{ "raylib.Raylib.loadMaterialDefault()", wren_raylib_load_material_default },
    .{ "raylib.Raylib.isMaterialValid(_)", wren_raylib_is_material_valid },
    .{ "raylib.Raylib.unloadMaterial(_)", wren_raylib_unload_material },
    .{ "raylib.Raylib.setMaterialTexture(_,_,_)", wren_raylib_set_material_texture },
    .{ "raylib.Raylib.setModelMeshMaterial(_,_,_)", wren_raylib_set_model_mesh_material },
    .{ "raylib.Raylib.loadModelAnimations(_,_)", wren_raylib_load_model_animations },
    .{ "raylib.Raylib.updateModelAnimation(_,_,_)", wren_raylib_update_model_animation },
    .{ "raylib.Raylib.updateModelAnimationBones(_,_,_)", wren_raylib_update_model_animation_bones },
    .{ "raylib.Raylib.unloadModelAnimation(_)", wren_raylib_unload_model_animation },
    .{ "raylib.Raylib.unloadModelAnimations(_,_)", wren_raylib_unload_model_animations },
    .{ "raylib.Raylib.isModelAnimationValid(_,_)", wren_raylib_is_model_animation_valid },
    .{ "raylib.Raylib.checkCollisionSpheres(_,_,_,_)", wren_raylib_check_collision_spheres },
    .{ "raylib.Raylib.checkCollisionBoxes(_,_)", wren_raylib_check_collision_boxes },
    .{ "raylib.Raylib.checkCollisionBoxSphere(_,_,_)", wren_raylib_check_collision_box_sphere },
    .{ "raylib.Raylib.getRayCollisionSphere(_,_,_)", wren_raylib_get_ray_collision_sphere },
    .{ "raylib.Raylib.getRayCollisionBox(_,_)", wren_raylib_get_ray_collision_box },
    .{ "raylib.Raylib.getRayCollisionMesh(_,_,_)", wren_raylib_get_ray_collision_mesh },
    .{ "raylib.Raylib.getRayCollisionTriangle(_,_,_,_)", wren_raylib_get_ray_collision_triangle },
    .{ "raylib.Raylib.getRayCollisionQuad(_,_,_,_,_)", wren_raylib_get_ray_collision_quad },
    .{ "raylib.Raylib.initAudioDevice()", wren_raylib_init_audio_device },
    .{ "raylib.Raylib.closeAudioDevice()", wren_raylib_close_audio_device },
    .{ "raylib.Raylib.isAudioDeviceReady()", wren_raylib_is_audio_device_ready },
    .{ "raylib.Raylib.setMasterVolume(_)", wren_raylib_set_master_volume },
    .{ "raylib.Raylib.getMasterVolume()", wren_raylib_get_master_volume },
    .{ "raylib.Raylib.loadWave(_)", wren_raylib_load_wave },
    .{ "raylib.Raylib.loadWaveFromMemory(_,_,_)", wren_raylib_load_wave_from_memory },
    .{ "raylib.Raylib.isWaveValid(_)", wren_raylib_is_wave_valid },
    .{ "raylib.Raylib.loadSound(_)", wren_raylib_load_sound },
    .{ "raylib.Raylib.loadSoundFromWave(_)", wren_raylib_load_sound_from_wave },
    .{ "raylib.Raylib.loadSoundAlias(_)", wren_raylib_load_sound_alias },
    .{ "raylib.Raylib.isSoundValid(_)", wren_raylib_is_sound_valid },
    .{ "raylib.Raylib.updateSound(_,_,_)", wren_raylib_update_sound },
    .{ "raylib.Raylib.unloadWave(_)", wren_raylib_unload_wave },
    .{ "raylib.Raylib.unloadSound(_)", wren_raylib_unload_sound },
    .{ "raylib.Raylib.unloadSoundAlias(_)", wren_raylib_unload_sound_alias },
    .{ "raylib.Raylib.exportWave(_,_)", wren_raylib_export_wave },
    .{ "raylib.Raylib.exportWaveAsCode(_,_)", wren_raylib_export_wave_as_code },
    .{ "raylib.Raylib.playSound(_)", wren_raylib_play_sound },
    .{ "raylib.Raylib.stopSound(_)", wren_raylib_stop_sound },
    .{ "raylib.Raylib.pauseSound(_)", wren_raylib_pause_sound },
    .{ "raylib.Raylib.resumeSound(_)", wren_raylib_resume_sound },
    .{ "raylib.Raylib.isSoundPlaying(_)", wren_raylib_is_sound_playing },
    .{ "raylib.Raylib.setSoundVolume(_,_)", wren_raylib_set_sound_volume },
    .{ "raylib.Raylib.setSoundPitch(_,_)", wren_raylib_set_sound_pitch },
    .{ "raylib.Raylib.setSoundPan(_,_)", wren_raylib_set_sound_pan },
    .{ "raylib.Raylib.waveCopy(_)", wren_raylib_wave_copy },
    .{ "raylib.Raylib.waveCrop(_,_,_)", wren_raylib_wave_crop },
    .{ "raylib.Raylib.waveFormat(_,_,_,_)", wren_raylib_wave_format },
    .{ "raylib.Raylib.loadWaveSamples(_)", wren_raylib_load_wave_samples },
    .{ "raylib.Raylib.unloadWaveSamples(_)", wren_raylib_unload_wave_samples },
    .{ "raylib.Raylib.loadMusicStream(_)", wren_raylib_load_music_stream },
    .{ "raylib.Raylib.loadMusicStreamFromMemory(_,_,_)", wren_raylib_load_music_stream_from_memory },
    .{ "raylib.Raylib.isMusicValid(_)", wren_raylib_is_music_valid },
    .{ "raylib.Raylib.unloadMusicStream(_)", wren_raylib_unload_music_stream },
    .{ "raylib.Raylib.playMusicStream(_)", wren_raylib_play_music_stream },
    .{ "raylib.Raylib.isMusicStreamPlaying(_)", wren_raylib_is_music_stream_playing },
    .{ "raylib.Raylib.updateMusicStream(_)", wren_raylib_update_music_stream },
    .{ "raylib.Raylib.stopMusicStream(_)", wren_raylib_stop_music_stream },
    .{ "raylib.Raylib.pauseMusicStream(_)", wren_raylib_pause_music_stream },
    .{ "raylib.Raylib.resumeMusicStream(_)", wren_raylib_resume_music_stream },
    .{ "raylib.Raylib.seekMusicStream(_,_)", wren_raylib_seek_music_stream },
    .{ "raylib.Raylib.setMusicVolume(_,_)", wren_raylib_set_music_volume },
    .{ "raylib.Raylib.setMusicPitch(_,_)", wren_raylib_set_music_pitch },
    .{ "raylib.Raylib.setMusicPan(_,_)", wren_raylib_set_music_pan },
    .{ "raylib.Raylib.getMusicTimeLength(_)", wren_raylib_get_music_time_length },
    .{ "raylib.Raylib.getMusicTimePlayed(_)", wren_raylib_get_music_time_played },
    .{ "raylib.Raylib.loadAudioStream(_,_,_)", wren_raylib_load_audio_stream },
    .{ "raylib.Raylib.isAudioStreamValid(_)", wren_raylib_is_audio_stream_valid },
    .{ "raylib.Raylib.unloadAudioStream(_)", wren_raylib_unload_audio_stream },
    .{ "raylib.Raylib.updateAudioStream(_,_,_)", wren_raylib_update_audio_stream },
    .{ "raylib.Raylib.isAudioStreamProcessed(_)", wren_raylib_is_audio_stream_processed },
    .{ "raylib.Raylib.playAudioStream(_)", wren_raylib_play_audio_stream },
    .{ "raylib.Raylib.pauseAudioStream(_)", wren_raylib_pause_audio_stream },
    .{ "raylib.Raylib.resumeAudioStream(_)", wren_raylib_resume_audio_stream },
    .{ "raylib.Raylib.isAudioStreamPlaying(_)", wren_raylib_is_audio_stream_playing },
    .{ "raylib.Raylib.stopAudioStream(_)", wren_raylib_stop_audio_stream },
    .{ "raylib.Raylib.setAudioStreamVolume(_,_)", wren_raylib_set_audio_stream_volume },
    .{ "raylib.Raylib.setAudioStreamPitch(_,_)", wren_raylib_set_audio_stream_pitch },
    .{ "raylib.Raylib.setAudioStreamPan(_,_)", wren_raylib_set_audio_stream_pan },
    .{ "raylib.Raylib.setAudioStreamBufferSizeDefault(_)", wren_raylib_set_audio_stream_buffer_size_default },
    .{ "raylib.Raylib.setAudioStreamCallback(_,_)", wren_raylib_set_audio_stream_callback },
    .{ "raylib.Raylib.attachAudioStreamProcessor(_,_)", wren_raylib_attach_audio_stream_processor },
    .{ "raylib.Raylib.detachAudioStreamProcessor(_,_)", wren_raylib_detach_audio_stream_processor },
    .{ "raylib.Raylib.attachAudioMixedProcessor(_)", wren_raylib_attach_audio_mixed_processor },
    .{ "raylib.Raylib.detachAudioMixedProcessor(_)", wren_raylib_detach_audio_mixed_processor },
});

pub const ForeignClassBindings = std.StaticStringMap(ForeignClass).initComptime(.{
    .{ "raylib.Color", ForeignClass{ .allocate = Color.allocate } },
    .{ "raylib.RenderTexture2D", ForeignClass{ .allocate = RenderTexture2D.allocate } },
    .{ "raylib.Camera2D", ForeignClass{ .allocate = Camera2D.allocate } },
    .{ "raylib.Vector2", ForeignClass{ .allocate = Vector2.allocate } },
    .{ "raylib.Vector3", ForeignClass{ .allocate = RaylibBindings.Vector3.allocate } },
    .{ "raylib.Rectangle", ForeignClass{ .allocate = Rectangle.allocate } },
    .{ "raylib.Image", ForeignClass{ .allocate = Image.allocate } },
    .{ "raylib.Font", ForeignClass{ .allocate = Font.allocate } },
    .{ "raylib.Wave", ForeignClass{ .allocate = Wave.allocate } },
    .{ "raylib.Sound", ForeignClass{ .allocate = Wave.allocate } },
    .{ "raylib.Music", ForeignClass{ .allocate = Wave.allocate } },
    .{ "raylib.AudioStream", ForeignClass{ .allocate = Wave.allocate } },
});
