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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    wren.wrenSetSlotBool(vm, 0, r.IsWindowState(@"0"));
}

pub fn wren_raylib_set_window_state(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetWindowState(@"0");
}

pub fn wren_raylib_clear_window_state(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
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
    const @"0": r.Image = ptr_0.?.*;
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
    const @"0" = wren.wrenGetSlotDouble(vm, 1);
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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.LoadRandomSequence(@"0", @"1", @"2"))));
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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.MemAlloc(@"0");
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
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.UnloadFileData(@"0");
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
    const @"0" = wren.wrenGetSlotString(vm, 1);
    r.UnloadFileText(@"0");
}

pub fn wren_raylib_save_file_text(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1" = wren.wrenGetSlotString(vm, 2);
    wren.wrenSetSlotBool(vm, 0, r.SaveFileText(@"0", @"1"));
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
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeCRC32(@"0", @"1"))));
}

pub fn wren_raylib_compute_m_d5(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeMD5(@"0", @"1"))));
}

pub fn wren_raylib_compute_s_h_a1(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0" = wren.wrenGetSlotString(vm, 1);
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.ComputeSHA1(@"0", @"1"))));
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
    const @"0": r.AutomationEventList = ptr_0.?.*;
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"0" = wren.wrenGetSlotDouble(vm, 1);
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    r.SetGesturesEnabled(@"0");
}

pub fn wren_raylib_is_gesture_detected(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
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
    const @"0": r.Camera = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    r.UpdateCamera(@"0", @"1");
}

pub fn wren_raylib_update_camera_pro(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Camera = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Camera = ptr_0.?.*;
    const foreign_1 = wren.wrenGetSlotForeign(vm, 2);
    const ptr_1: ?*r.Vector3 = @alignCast(@ptrCast(foreign_1));
    const @"1": r.Vector3 = ptr_1.?.*;
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector3 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector3 = ptr_2.?.*;
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawLineEx(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_line_strip(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawLineBezier(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_circle(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCircleV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_circle_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Color = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Color = ptr_2.?.*;
    r.DrawCircleLinesV(@"0", @"1", @"2");
}

pub fn wren_raylib_draw_ellipse(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
    const foreign_4 = wren.wrenGetSlotForeign(vm, 5);
    const ptr_4: ?*r.Color = @alignCast(@ptrCast(foreign_4));
    const @"4": r.Color = ptr_4.?.*;
    r.DrawEllipse(@"0", @"1", @"2", @"3", @"4");
}

pub fn wren_raylib_draw_ellipse_lines(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const @"0": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const @"2": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 3));
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"0": r.Vector2 = ptr_0.?.*;
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
    const @"0": r.Vector2 = ptr_0.?.*;
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
    const foreign_5 = wren.wrenGetSlotForeign(vm, 6);
    const ptr_5: ?*r.Color = @alignCast(@ptrCast(foreign_5));
    const @"5": r.Color = ptr_5.?.*;
    r.DrawPolyLinesEx(@"0", @"1", @"2", @"3", @"4", @"5");
}

pub fn wren_raylib_draw_spline_linear(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineLinear(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_basis(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineBasis(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_catmull_rom(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineCatmullRom(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_bezier_quadratic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
    const foreign_3 = wren.wrenGetSlotForeign(vm, 4);
    const ptr_3: ?*r.Color = @alignCast(@ptrCast(foreign_3));
    const @"3": r.Color = ptr_3.?.*;
    r.DrawSplineBezierQuadratic(@"0", @"1", @"2", @"3");
}

pub fn wren_raylib_draw_spline_bezier_cubic(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 2));
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
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
    const @"4" = wren.wrenGetSlotDouble(vm, 5);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
    const foreign_2 = wren.wrenGetSlotForeign(vm, 3);
    const ptr_2: ?*r.Vector2 = @alignCast(@ptrCast(foreign_2));
    const @"2": r.Vector2 = ptr_2.?.*;
    const @"3" = wren.wrenGetSlotDouble(vm, 4);
    wren.wrenSetSlotBool(vm, 0, r.CheckCollisionCircles(@"0", @"1", @"2", @"3"));
}

pub fn wren_raylib_check_collision_circle_rec(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};
    const foreign_0 = wren.wrenGetSlotForeign(vm, 1);
    const ptr_0: ?*r.Vector2 = @alignCast(@ptrCast(foreign_0));
    const @"0": r.Vector2 = ptr_0.?.*;
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"1" = wren.wrenGetSlotDouble(vm, 2);
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
    const @"2" = wren.wrenGetSlotDouble(vm, 3);
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
    const @"1": r.Vector2 = ptr_1.?.*;
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
    const @"4": r.Vector2 = ptr_4.?.*;
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

pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;
pub const ForeignMethodBindings = std.StaticStringMap(?*const WrenForeignMethodFn).initComptime(.{
    .{ "raylib.Raylib.init_window(_,_,_)", wren_raylib_init_window },
    .{ "raylib.Raylib.close_window()", wren_raylib_close_window },
    .{ "raylib.Raylib.window_should_close()", wren_raylib_window_should_close },
    .{ "raylib.Raylib.is_window_ready()", wren_raylib_is_window_ready },
    .{ "raylib.Raylib.is_window_fullscreen()", wren_raylib_is_window_fullscreen },
    .{ "raylib.Raylib.is_window_hidden()", wren_raylib_is_window_hidden },
    .{ "raylib.Raylib.is_window_minimized()", wren_raylib_is_window_minimized },
    .{ "raylib.Raylib.is_window_maximized()", wren_raylib_is_window_maximized },
    .{ "raylib.Raylib.is_window_focused()", wren_raylib_is_window_focused },
    .{ "raylib.Raylib.is_window_resized()", wren_raylib_is_window_resized },
    .{ "raylib.Raylib.is_window_state(_)", wren_raylib_is_window_state },
    .{ "raylib.Raylib.set_window_state(_)", wren_raylib_set_window_state },
    .{ "raylib.Raylib.clear_window_state(_)", wren_raylib_clear_window_state },
    .{ "raylib.Raylib.toggle_fullscreen()", wren_raylib_toggle_fullscreen },
    .{ "raylib.Raylib.toggle_borderless_windowed()", wren_raylib_toggle_borderless_windowed },
    .{ "raylib.Raylib.maximize_window()", wren_raylib_maximize_window },
    .{ "raylib.Raylib.minimize_window()", wren_raylib_minimize_window },
    .{ "raylib.Raylib.restore_window()", wren_raylib_restore_window },
    .{ "raylib.Raylib.set_window_icon(_)", wren_raylib_set_window_icon },
    .{ "raylib.Raylib.set_window_icons(_,_)", wren_raylib_set_window_icons },
    .{ "raylib.Raylib.set_window_title(_)", wren_raylib_set_window_title },
    .{ "raylib.Raylib.set_window_position(_,_)", wren_raylib_set_window_position },
    .{ "raylib.Raylib.set_window_monitor(_)", wren_raylib_set_window_monitor },
    .{ "raylib.Raylib.set_window_min_size(_,_)", wren_raylib_set_window_min_size },
    .{ "raylib.Raylib.set_window_max_size(_,_)", wren_raylib_set_window_max_size },
    .{ "raylib.Raylib.set_window_size(_,_)", wren_raylib_set_window_size },
    .{ "raylib.Raylib.set_window_opacity(_)", wren_raylib_set_window_opacity },
    .{ "raylib.Raylib.set_window_focused()", wren_raylib_set_window_focused },
    .{ "raylib.Raylib.get_screen_width()", wren_raylib_get_screen_width },
    .{ "raylib.Raylib.get_screen_height()", wren_raylib_get_screen_height },
    .{ "raylib.Raylib.get_render_width()", wren_raylib_get_render_width },
    .{ "raylib.Raylib.get_render_height()", wren_raylib_get_render_height },
    .{ "raylib.Raylib.get_monitor_count()", wren_raylib_get_monitor_count },
    .{ "raylib.Raylib.get_current_monitor()", wren_raylib_get_current_monitor },
    .{ "raylib.Raylib.get_monitor_position(_)", wren_raylib_get_monitor_position },
    .{ "raylib.Raylib.get_monitor_width(_)", wren_raylib_get_monitor_width },
    .{ "raylib.Raylib.get_monitor_height(_)", wren_raylib_get_monitor_height },
    .{ "raylib.Raylib.get_monitor_physical_width(_)", wren_raylib_get_monitor_physical_width },
    .{ "raylib.Raylib.get_monitor_physical_height(_)", wren_raylib_get_monitor_physical_height },
    .{ "raylib.Raylib.get_monitor_refresh_rate(_)", wren_raylib_get_monitor_refresh_rate },
    .{ "raylib.Raylib.get_window_position()", wren_raylib_get_window_position },
    .{ "raylib.Raylib.get_window_scale_d_p_i()", wren_raylib_get_window_scale_d_p_i },
    .{ "raylib.Raylib.get_monitor_name(_)", wren_raylib_get_monitor_name },
    .{ "raylib.Raylib.set_clipboard_text(_)", wren_raylib_set_clipboard_text },
    .{ "raylib.Raylib.get_clipboard_text()", wren_raylib_get_clipboard_text },
    .{ "raylib.Raylib.get_clipboard_image()", wren_raylib_get_clipboard_image },
    .{ "raylib.Raylib.enable_event_waiting()", wren_raylib_enable_event_waiting },
    .{ "raylib.Raylib.disable_event_waiting()", wren_raylib_disable_event_waiting },
    .{ "raylib.Raylib.show_cursor()", wren_raylib_show_cursor },
    .{ "raylib.Raylib.hide_cursor()", wren_raylib_hide_cursor },
    .{ "raylib.Raylib.is_cursor_hidden()", wren_raylib_is_cursor_hidden },
    .{ "raylib.Raylib.enable_cursor()", wren_raylib_enable_cursor },
    .{ "raylib.Raylib.disable_cursor()", wren_raylib_disable_cursor },
    .{ "raylib.Raylib.is_cursor_on_screen()", wren_raylib_is_cursor_on_screen },
    .{ "raylib.Raylib.clear_background(_)", wren_raylib_clear_background },
    .{ "raylib.Raylib.begin_drawing()", wren_raylib_begin_drawing },
    .{ "raylib.Raylib.end_drawing()", wren_raylib_end_drawing },
    .{ "raylib.Raylib.begin_mode2_d(_)", wren_raylib_begin_mode2_d },
    .{ "raylib.Raylib.end_mode2_d()", wren_raylib_end_mode2_d },
    .{ "raylib.Raylib.begin_mode3_d(_)", wren_raylib_begin_mode3_d },
    .{ "raylib.Raylib.end_mode3_d()", wren_raylib_end_mode3_d },
    .{ "raylib.Raylib.begin_texture_mode(_)", wren_raylib_begin_texture_mode },
    .{ "raylib.Raylib.end_texture_mode()", wren_raylib_end_texture_mode },
    .{ "raylib.Raylib.begin_shader_mode(_)", wren_raylib_begin_shader_mode },
    .{ "raylib.Raylib.end_shader_mode()", wren_raylib_end_shader_mode },
    .{ "raylib.Raylib.begin_blend_mode(_)", wren_raylib_begin_blend_mode },
    .{ "raylib.Raylib.end_blend_mode()", wren_raylib_end_blend_mode },
    .{ "raylib.Raylib.begin_scissor_mode(_,_,_,_)", wren_raylib_begin_scissor_mode },
    .{ "raylib.Raylib.end_scissor_mode()", wren_raylib_end_scissor_mode },
    .{ "raylib.Raylib.begin_vr_stereo_mode(_)", wren_raylib_begin_vr_stereo_mode },
    .{ "raylib.Raylib.end_vr_stereo_mode()", wren_raylib_end_vr_stereo_mode },
    .{ "raylib.Raylib.load_vr_stereo_config(_)", wren_raylib_load_vr_stereo_config },
    .{ "raylib.Raylib.unload_vr_stereo_config(_)", wren_raylib_unload_vr_stereo_config },
    .{ "raylib.Raylib.load_shader(_,_)", wren_raylib_load_shader },
    .{ "raylib.Raylib.load_shader_from_memory(_,_)", wren_raylib_load_shader_from_memory },
    .{ "raylib.Raylib.is_shader_valid(_)", wren_raylib_is_shader_valid },
    .{ "raylib.Raylib.get_shader_location(_,_)", wren_raylib_get_shader_location },
    .{ "raylib.Raylib.get_shader_location_attrib(_,_)", wren_raylib_get_shader_location_attrib },
    .{ "raylib.Raylib.set_shader_value_matrix(_,_,_)", wren_raylib_set_shader_value_matrix },
    .{ "raylib.Raylib.set_shader_value_texture(_,_,_)", wren_raylib_set_shader_value_texture },
    .{ "raylib.Raylib.unload_shader(_)", wren_raylib_unload_shader },
    .{ "raylib.Raylib.get_screen_to_world_ray(_,_)", wren_raylib_get_screen_to_world_ray },
    .{ "raylib.Raylib.get_screen_to_world_ray_ex(_,_,_,_)", wren_raylib_get_screen_to_world_ray_ex },
    .{ "raylib.Raylib.get_world_to_screen(_,_)", wren_raylib_get_world_to_screen },
    .{ "raylib.Raylib.get_world_to_screen_ex(_,_,_,_)", wren_raylib_get_world_to_screen_ex },
    .{ "raylib.Raylib.get_world_to_screen2_d(_,_)", wren_raylib_get_world_to_screen2_d },
    .{ "raylib.Raylib.get_screen_to_world2_d(_,_)", wren_raylib_get_screen_to_world2_d },
    .{ "raylib.Raylib.get_camera_matrix(_)", wren_raylib_get_camera_matrix },
    .{ "raylib.Raylib.get_camera_matrix2_d(_)", wren_raylib_get_camera_matrix2_d },
    .{ "raylib.Raylib.set_target_f_p_s(_)", wren_raylib_set_target_f_p_s },
    .{ "raylib.Raylib.get_frame_time()", wren_raylib_get_frame_time },
    .{ "raylib.Raylib.get_time()", wren_raylib_get_time },
    .{ "raylib.Raylib.get_f_p_s()", wren_raylib_get_f_p_s },
    .{ "raylib.Raylib.swap_screen_buffer()", wren_raylib_swap_screen_buffer },
    .{ "raylib.Raylib.poll_input_events()", wren_raylib_poll_input_events },
    .{ "raylib.Raylib.wait_time(_)", wren_raylib_wait_time },
    .{ "raylib.Raylib.set_random_seed(_)", wren_raylib_set_random_seed },
    .{ "raylib.Raylib.get_random_value(_,_)", wren_raylib_get_random_value },
    .{ "raylib.Raylib.load_random_sequence(_,_,_)", wren_raylib_load_random_sequence },
    .{ "raylib.Raylib.unload_random_sequence(_)", wren_raylib_unload_random_sequence },
    .{ "raylib.Raylib.take_screenshot(_)", wren_raylib_take_screenshot },
    .{ "raylib.Raylib.set_config_flags(_)", wren_raylib_set_config_flags },
    .{ "raylib.Raylib.open_u_r_l(_)", wren_raylib_open_u_r_l },
    .{ "raylib.Raylib.set_trace_log_level(_)", wren_raylib_set_trace_log_level },
    .{ "raylib.Raylib.mem_alloc(_)", wren_raylib_mem_alloc },
    .{ "raylib.Raylib.set_trace_log_callback(_)", wren_raylib_set_trace_log_callback },
    .{ "raylib.Raylib.set_load_file_data_callback(_)", wren_raylib_set_load_file_data_callback },
    .{ "raylib.Raylib.set_save_file_data_callback(_)", wren_raylib_set_save_file_data_callback },
    .{ "raylib.Raylib.set_load_file_text_callback(_)", wren_raylib_set_load_file_text_callback },
    .{ "raylib.Raylib.set_save_file_text_callback(_)", wren_raylib_set_save_file_text_callback },
    .{ "raylib.Raylib.load_file_data(_,_)", wren_raylib_load_file_data },
    .{ "raylib.Raylib.unload_file_data(_)", wren_raylib_unload_file_data },
    .{ "raylib.Raylib.export_data_as_code(_,_,_)", wren_raylib_export_data_as_code },
    .{ "raylib.Raylib.load_file_text(_)", wren_raylib_load_file_text },
    .{ "raylib.Raylib.unload_file_text(_)", wren_raylib_unload_file_text },
    .{ "raylib.Raylib.save_file_text(_,_)", wren_raylib_save_file_text },
    .{ "raylib.Raylib.file_exists(_)", wren_raylib_file_exists },
    .{ "raylib.Raylib.directory_exists(_)", wren_raylib_directory_exists },
    .{ "raylib.Raylib.is_file_extension(_,_)", wren_raylib_is_file_extension },
    .{ "raylib.Raylib.get_file_length(_)", wren_raylib_get_file_length },
    .{ "raylib.Raylib.get_file_extension(_)", wren_raylib_get_file_extension },
    .{ "raylib.Raylib.get_file_name(_)", wren_raylib_get_file_name },
    .{ "raylib.Raylib.get_file_name_without_ext(_)", wren_raylib_get_file_name_without_ext },
    .{ "raylib.Raylib.get_directory_path(_)", wren_raylib_get_directory_path },
    .{ "raylib.Raylib.get_prev_directory_path(_)", wren_raylib_get_prev_directory_path },
    .{ "raylib.Raylib.get_working_directory()", wren_raylib_get_working_directory },
    .{ "raylib.Raylib.get_application_directory()", wren_raylib_get_application_directory },
    .{ "raylib.Raylib.make_directory(_)", wren_raylib_make_directory },
    .{ "raylib.Raylib.change_directory(_)", wren_raylib_change_directory },
    .{ "raylib.Raylib.is_path_file(_)", wren_raylib_is_path_file },
    .{ "raylib.Raylib.is_file_name_valid(_)", wren_raylib_is_file_name_valid },
    .{ "raylib.Raylib.load_directory_files(_)", wren_raylib_load_directory_files },
    .{ "raylib.Raylib.load_directory_files_ex(_,_,_)", wren_raylib_load_directory_files_ex },
    .{ "raylib.Raylib.unload_directory_files(_)", wren_raylib_unload_directory_files },
    .{ "raylib.Raylib.is_file_dropped()", wren_raylib_is_file_dropped },
    .{ "raylib.Raylib.load_dropped_files()", wren_raylib_load_dropped_files },
    .{ "raylib.Raylib.unload_dropped_files(_)", wren_raylib_unload_dropped_files },
    .{ "raylib.Raylib.get_file_mod_time(_)", wren_raylib_get_file_mod_time },
    .{ "raylib.Raylib.compress_data(_,_,_)", wren_raylib_compress_data },
    .{ "raylib.Raylib.decompress_data(_,_,_)", wren_raylib_decompress_data },
    .{ "raylib.Raylib.encode_data_base64(_,_,_)", wren_raylib_encode_data_base64 },
    .{ "raylib.Raylib.decode_data_base64(_,_)", wren_raylib_decode_data_base64 },
    .{ "raylib.Raylib.compute_c_r_c32(_,_)", wren_raylib_compute_c_r_c32 },
    .{ "raylib.Raylib.compute_m_d5(_,_)", wren_raylib_compute_m_d5 },
    .{ "raylib.Raylib.compute_s_h_a1(_,_)", wren_raylib_compute_s_h_a1 },
    .{ "raylib.Raylib.load_automation_event_list(_)", wren_raylib_load_automation_event_list },
    .{ "raylib.Raylib.unload_automation_event_list(_)", wren_raylib_unload_automation_event_list },
    .{ "raylib.Raylib.export_automation_event_list(_,_)", wren_raylib_export_automation_event_list },
    .{ "raylib.Raylib.set_automation_event_list(_)", wren_raylib_set_automation_event_list },
    .{ "raylib.Raylib.set_automation_event_base_frame(_)", wren_raylib_set_automation_event_base_frame },
    .{ "raylib.Raylib.start_automation_event_recording()", wren_raylib_start_automation_event_recording },
    .{ "raylib.Raylib.stop_automation_event_recording()", wren_raylib_stop_automation_event_recording },
    .{ "raylib.Raylib.play_automation_event(_)", wren_raylib_play_automation_event },
    .{ "raylib.Raylib.is_key_pressed(_)", wren_raylib_is_key_pressed },
    .{ "raylib.Raylib.is_key_pressed_repeat(_)", wren_raylib_is_key_pressed_repeat },
    .{ "raylib.Raylib.is_key_down(_)", wren_raylib_is_key_down },
    .{ "raylib.Raylib.is_key_released(_)", wren_raylib_is_key_released },
    .{ "raylib.Raylib.is_key_up(_)", wren_raylib_is_key_up },
    .{ "raylib.Raylib.get_key_pressed()", wren_raylib_get_key_pressed },
    .{ "raylib.Raylib.get_char_pressed()", wren_raylib_get_char_pressed },
    .{ "raylib.Raylib.set_exit_key(_)", wren_raylib_set_exit_key },
    .{ "raylib.Raylib.is_gamepad_available(_)", wren_raylib_is_gamepad_available },
    .{ "raylib.Raylib.get_gamepad_name(_)", wren_raylib_get_gamepad_name },
    .{ "raylib.Raylib.is_gamepad_button_pressed(_,_)", wren_raylib_is_gamepad_button_pressed },
    .{ "raylib.Raylib.is_gamepad_button_down(_,_)", wren_raylib_is_gamepad_button_down },
    .{ "raylib.Raylib.is_gamepad_button_released(_,_)", wren_raylib_is_gamepad_button_released },
    .{ "raylib.Raylib.is_gamepad_button_up(_,_)", wren_raylib_is_gamepad_button_up },
    .{ "raylib.Raylib.get_gamepad_button_pressed()", wren_raylib_get_gamepad_button_pressed },
    .{ "raylib.Raylib.get_gamepad_axis_count(_)", wren_raylib_get_gamepad_axis_count },
    .{ "raylib.Raylib.get_gamepad_axis_movement(_,_)", wren_raylib_get_gamepad_axis_movement },
    .{ "raylib.Raylib.set_gamepad_mappings(_)", wren_raylib_set_gamepad_mappings },
    .{ "raylib.Raylib.set_gamepad_vibration(_,_,_,_)", wren_raylib_set_gamepad_vibration },
    .{ "raylib.Raylib.is_mouse_button_pressed(_)", wren_raylib_is_mouse_button_pressed },
    .{ "raylib.Raylib.is_mouse_button_down(_)", wren_raylib_is_mouse_button_down },
    .{ "raylib.Raylib.is_mouse_button_released(_)", wren_raylib_is_mouse_button_released },
    .{ "raylib.Raylib.is_mouse_button_up(_)", wren_raylib_is_mouse_button_up },
    .{ "raylib.Raylib.get_mouse_x()", wren_raylib_get_mouse_x },
    .{ "raylib.Raylib.get_mouse_y()", wren_raylib_get_mouse_y },
    .{ "raylib.Raylib.get_mouse_position()", wren_raylib_get_mouse_position },
    .{ "raylib.Raylib.get_mouse_delta()", wren_raylib_get_mouse_delta },
    .{ "raylib.Raylib.set_mouse_position(_,_)", wren_raylib_set_mouse_position },
    .{ "raylib.Raylib.set_mouse_offset(_,_)", wren_raylib_set_mouse_offset },
    .{ "raylib.Raylib.set_mouse_scale(_,_)", wren_raylib_set_mouse_scale },
    .{ "raylib.Raylib.get_mouse_wheel_move()", wren_raylib_get_mouse_wheel_move },
    .{ "raylib.Raylib.get_mouse_wheel_move_v()", wren_raylib_get_mouse_wheel_move_v },
    .{ "raylib.Raylib.set_mouse_cursor(_)", wren_raylib_set_mouse_cursor },
    .{ "raylib.Raylib.get_touch_x()", wren_raylib_get_touch_x },
    .{ "raylib.Raylib.get_touch_y()", wren_raylib_get_touch_y },
    .{ "raylib.Raylib.get_touch_position(_)", wren_raylib_get_touch_position },
    .{ "raylib.Raylib.get_touch_point_id(_)", wren_raylib_get_touch_point_id },
    .{ "raylib.Raylib.get_touch_point_count()", wren_raylib_get_touch_point_count },
    .{ "raylib.Raylib.set_gestures_enabled(_)", wren_raylib_set_gestures_enabled },
    .{ "raylib.Raylib.is_gesture_detected(_)", wren_raylib_is_gesture_detected },
    .{ "raylib.Raylib.get_gesture_detected()", wren_raylib_get_gesture_detected },
    .{ "raylib.Raylib.get_gesture_hold_duration()", wren_raylib_get_gesture_hold_duration },
    .{ "raylib.Raylib.get_gesture_drag_vector()", wren_raylib_get_gesture_drag_vector },
    .{ "raylib.Raylib.get_gesture_drag_angle()", wren_raylib_get_gesture_drag_angle },
    .{ "raylib.Raylib.get_gesture_pinch_vector()", wren_raylib_get_gesture_pinch_vector },
    .{ "raylib.Raylib.get_gesture_pinch_angle()", wren_raylib_get_gesture_pinch_angle },
    .{ "raylib.Raylib.update_camera(_,_)", wren_raylib_update_camera },
    .{ "raylib.Raylib.update_camera_pro(_,_,_,_)", wren_raylib_update_camera_pro },
    .{ "raylib.Raylib.draw_pixel(_,_,_)", wren_raylib_draw_pixel },
    .{ "raylib.Raylib.draw_pixel_v(_,_)", wren_raylib_draw_pixel_v },
    .{ "raylib.Raylib.draw_line(_,_,_,_,_)", wren_raylib_draw_line },
    .{ "raylib.Raylib.draw_line_v(_,_,_)", wren_raylib_draw_line_v },
    .{ "raylib.Raylib.draw_line_ex(_,_,_,_)", wren_raylib_draw_line_ex },
    .{ "raylib.Raylib.draw_line_strip(_,_,_)", wren_raylib_draw_line_strip },
    .{ "raylib.Raylib.draw_line_bezier(_,_,_,_)", wren_raylib_draw_line_bezier },
    .{ "raylib.Raylib.draw_circle(_,_,_,_)", wren_raylib_draw_circle },
    .{ "raylib.Raylib.draw_circle_sector(_,_,_,_,_,_)", wren_raylib_draw_circle_sector },
    .{ "raylib.Raylib.draw_circle_sector_lines(_,_,_,_,_,_)", wren_raylib_draw_circle_sector_lines },
    .{ "raylib.Raylib.draw_circle_gradient(_,_,_,_,_)", wren_raylib_draw_circle_gradient },
    .{ "raylib.Raylib.draw_circle_v(_,_,_)", wren_raylib_draw_circle_v },
    .{ "raylib.Raylib.draw_circle_lines(_,_,_,_)", wren_raylib_draw_circle_lines },
    .{ "raylib.Raylib.draw_circle_lines_v(_,_,_)", wren_raylib_draw_circle_lines_v },
    .{ "raylib.Raylib.draw_ellipse(_,_,_,_,_)", wren_raylib_draw_ellipse },
    .{ "raylib.Raylib.draw_ellipse_lines(_,_,_,_,_)", wren_raylib_draw_ellipse_lines },
    .{ "raylib.Raylib.draw_ring(_,_,_,_,_,_,_)", wren_raylib_draw_ring },
    .{ "raylib.Raylib.draw_ring_lines(_,_,_,_,_,_,_)", wren_raylib_draw_ring_lines },
    .{ "raylib.Raylib.draw_rectangle(_,_,_,_,_)", wren_raylib_draw_rectangle },
    .{ "raylib.Raylib.draw_rectangle_v(_,_,_)", wren_raylib_draw_rectangle_v },
    .{ "raylib.Raylib.draw_rectangle_rec(_,_)", wren_raylib_draw_rectangle_rec },
    .{ "raylib.Raylib.draw_rectangle_pro(_,_,_,_)", wren_raylib_draw_rectangle_pro },
    .{ "raylib.Raylib.draw_rectangle_gradient_v(_,_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_v },
    .{ "raylib.Raylib.draw_rectangle_gradient_h(_,_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_h },
    .{ "raylib.Raylib.draw_rectangle_gradient_ex(_,_,_,_,_)", wren_raylib_draw_rectangle_gradient_ex },
    .{ "raylib.Raylib.draw_rectangle_lines(_,_,_,_,_)", wren_raylib_draw_rectangle_lines },
    .{ "raylib.Raylib.draw_rectangle_lines_ex(_,_,_)", wren_raylib_draw_rectangle_lines_ex },
    .{ "raylib.Raylib.draw_rectangle_rounded(_,_,_,_)", wren_raylib_draw_rectangle_rounded },
    .{ "raylib.Raylib.draw_rectangle_rounded_lines(_,_,_,_)", wren_raylib_draw_rectangle_rounded_lines },
    .{ "raylib.Raylib.draw_rectangle_rounded_lines_ex(_,_,_,_,_)", wren_raylib_draw_rectangle_rounded_lines_ex },
    .{ "raylib.Raylib.draw_triangle(_,_,_,_)", wren_raylib_draw_triangle },
    .{ "raylib.Raylib.draw_triangle_lines(_,_,_,_)", wren_raylib_draw_triangle_lines },
    .{ "raylib.Raylib.draw_triangle_fan(_,_,_)", wren_raylib_draw_triangle_fan },
    .{ "raylib.Raylib.draw_triangle_strip(_,_,_)", wren_raylib_draw_triangle_strip },
    .{ "raylib.Raylib.draw_poly(_,_,_,_,_)", wren_raylib_draw_poly },
    .{ "raylib.Raylib.draw_poly_lines(_,_,_,_,_)", wren_raylib_draw_poly_lines },
    .{ "raylib.Raylib.draw_poly_lines_ex(_,_,_,_,_,_)", wren_raylib_draw_poly_lines_ex },
    .{ "raylib.Raylib.draw_spline_linear(_,_,_,_)", wren_raylib_draw_spline_linear },
    .{ "raylib.Raylib.draw_spline_basis(_,_,_,_)", wren_raylib_draw_spline_basis },
    .{ "raylib.Raylib.draw_spline_catmull_rom(_,_,_,_)", wren_raylib_draw_spline_catmull_rom },
    .{ "raylib.Raylib.draw_spline_bezier_quadratic(_,_,_,_)", wren_raylib_draw_spline_bezier_quadratic },
    .{ "raylib.Raylib.draw_spline_bezier_cubic(_,_,_,_)", wren_raylib_draw_spline_bezier_cubic },
    .{ "raylib.Raylib.draw_spline_segment_linear(_,_,_,_)", wren_raylib_draw_spline_segment_linear },
    .{ "raylib.Raylib.draw_spline_segment_basis(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_basis },
    .{ "raylib.Raylib.draw_spline_segment_catmull_rom(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_catmull_rom },
    .{ "raylib.Raylib.draw_spline_segment_bezier_quadratic(_,_,_,_,_)", wren_raylib_draw_spline_segment_bezier_quadratic },
    .{ "raylib.Raylib.draw_spline_segment_bezier_cubic(_,_,_,_,_,_)", wren_raylib_draw_spline_segment_bezier_cubic },
    .{ "raylib.Raylib.get_spline_point_linear(_,_,_)", wren_raylib_get_spline_point_linear },
    .{ "raylib.Raylib.get_spline_point_basis(_,_,_,_,_)", wren_raylib_get_spline_point_basis },
    .{ "raylib.Raylib.get_spline_point_catmull_rom(_,_,_,_,_)", wren_raylib_get_spline_point_catmull_rom },
    .{ "raylib.Raylib.get_spline_point_bezier_quad(_,_,_,_)", wren_raylib_get_spline_point_bezier_quad },
    .{ "raylib.Raylib.get_spline_point_bezier_cubic(_,_,_,_,_)", wren_raylib_get_spline_point_bezier_cubic },
    .{ "raylib.Raylib.check_collision_recs(_,_)", wren_raylib_check_collision_recs },
    .{ "raylib.Raylib.check_collision_circles(_,_,_,_)", wren_raylib_check_collision_circles },
    .{ "raylib.Raylib.check_collision_circle_rec(_,_,_)", wren_raylib_check_collision_circle_rec },
    .{ "raylib.Raylib.check_collision_circle_line(_,_,_,_)", wren_raylib_check_collision_circle_line },
    .{ "raylib.Raylib.check_collision_point_rec(_,_)", wren_raylib_check_collision_point_rec },
    .{ "raylib.Raylib.check_collision_point_circle(_,_,_)", wren_raylib_check_collision_point_circle },
    .{ "raylib.Raylib.check_collision_point_triangle(_,_,_,_)", wren_raylib_check_collision_point_triangle },
    .{ "raylib.Raylib.check_collision_point_line(_,_,_,_)", wren_raylib_check_collision_point_line },
    .{ "raylib.Raylib.check_collision_point_poly(_,_,_)", wren_raylib_check_collision_point_poly },
    .{ "raylib.Raylib.check_collision_lines(_,_,_,_,_)", wren_raylib_check_collision_lines },
    .{ "raylib.Raylib.get_collision_rec(_,_)", wren_raylib_get_collision_rec },
});

pub const WrenForeignClassAllocatorFn = fn (?*wren.WrenVM) callconv(.c) void;
pub const ForeignClass = struct { allocate: ?*const WrenForeignClassAllocatorFn };

pub const ForeignClassBindings = std.StaticStringMap(ForeignClass).initComptime(.{
    .{ "raylib.Color", ForeignClass{ .allocate = Color.allocate } },
    .{ "raylib.RenderTexture2D", ForeignClass{ .allocate = RenderTexture2D.allocate } },
    .{ "raylib.Camera2D", ForeignClass{ .allocate = Camera2D.allocate } },
    .{ "raylib.Vector2", ForeignClass{ .allocate = Vector2.allocate } },
    .{ "raylib.Rectangle", ForeignClass{ .allocate = Rectangle.allocate } },
});

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
