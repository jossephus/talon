const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});
const VmContext = @import("../watcher/hot.zig").VmContext;

pub const BuiltinBindings = @This();

pub fn shouldStop(vm: ?*wren.WrenVM) callconv(.C) void {
    const context: *VmContext = @ptrCast(@alignCast(wren.wrenGetUserData(vm)));
    const should_stop = context.stop_signal.load(.acquire);
    wren.wrenSetSlotBool(vm, 0, should_stop);
}
