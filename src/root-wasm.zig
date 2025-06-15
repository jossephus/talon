const std = @import("std");
const builtin = @import("builtin");
const common = @import("common.zig");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});

pub const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

const Bindings = @import("bindings/index.zig");

var produce_executable = true;

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
//pub const allocator = debug_allocator.allocator();
pub const allocator = std.heap.wasm_allocator;

pub fn runWasm(script: []const u8) !void {
    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = common.writeFn;
    config.errorFn = common.errorFn;

    config.bindForeignClassFn = common.bindForiegnClass;
    config.bindForeignMethodFn = common.bindForeignMethod;

    config.resolveModuleFn = if (produce_executable) @import("./resolve_module.zig").resolveModule else common.resolveModule;
    config.loadModuleFn = common.loadModule;

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const result = wren.wrenInterpret(vm, "main", script.ptr);

    switch (result) {
        wren.WREN_RESULT_COMPILE_ERROR => {
            std.debug.print("Compile Error!\n", .{});
        },
        wren.WREN_RESULT_RUNTIME_ERROR => {
            std.debug.print("Runtime Error!\n", .{});
        },
        wren.WREN_RESULT_SUCCESS => {
            //std.debug.print("Success!\n", .{});
        },
        else => {},
    }
}
