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

pub fn log2(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@log2(a))));
}

pub fn log10(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@log10(a))));
}

pub fn abs(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@abs(a))));
}

pub fn exp(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@exp(a))));
}

pub fn exp2(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@exp2(a))));
}

pub fn tan(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@tan(a))));
}

pub fn sqrt(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@sqrt(a))));
}

pub fn floor(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@floor(a))));
}

pub fn ceil(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@ceil(a))));
}

pub fn trunc(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@trunc(a))));
}

pub fn round(vm: ?*wren.WrenVM) callconv(.C) void {
    const a = wren.wrenGetSlotDouble(vm, 1);
    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatCast(@trunc(a))));
}
