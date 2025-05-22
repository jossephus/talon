const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});

pub const MathBindings = @This();

pub fn min(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    const b = wren.wrenGetSlotDouble(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@min(a, b))));
}

pub fn max(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    const b = wren.wrenGetSlotDouble(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@max(a, b))));
}

pub fn sin(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@sin(a))));
}

pub fn cos(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@cos(a))));
}

pub fn pow(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    const b = wren.wrenGetSlotDouble(vm, 2);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(std.math.pow(f64, a, b))));
}

pub fn log(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@log(a))));
}

pub fn exp(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@exp(a))));
}
