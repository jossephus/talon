const std = @import("std");
const common = @import("../common.zig");
const wren = common.wren;
const VmContext = @import("../watcher/hot.zig").VmContext;

pub const BuiltinBindings = @This();

pub fn shouldStop(vm: ?*wren.WrenVM) callconv(.c) void {
    const user_data = wren.wrenGetUserData(vm);
    if (user_data == null) {
        // Not running in hot-reload mode, never stop
        wren.wrenSetSlotBool(vm, 0, false);
        return;
    }
    const context: *VmContext = @ptrCast(@alignCast(user_data));
    const should_stop = context.stop_signal.load(.acquire);
    wren.wrenSetSlotBool(vm, 0, should_stop);
}
