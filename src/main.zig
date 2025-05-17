const std = @import("std");
const wren = @cImport({
    @cInclude("wren.h");
});

const io = @embedFile("io.wren");

fn writeFn(vm: ?*wren.WrenVM, text: [*c]const u8) callconv(.C) void {
    _ = vm;
    std.debug.print("{s}", .{text});
}

fn errorFn(
    vm: ?*wren.WrenVM,
    errorType: wren.WrenErrorType,
    module: [*c]const u8,
    line: c_int,
    msg: [*c]const u8,
) callconv(.C) void {
    _ = vm;
    switch (errorType) {
        wren.WREN_ERROR_COMPILE => {
            std.debug.print("[{s} line {d}] [Error] {s}\n", .{ module, line, msg });
        },
        wren.WREN_ERROR_STACK_TRACE => {
            std.debug.print("[{s} line {d}] in {s}\n", .{ module, line, msg });
        },
        wren.WREN_ERROR_RUNTIME => {
            std.debug.print("[Runtime Error] {s}\n", .{msg});
        },
        else => {},
    }
}

const count = 0;

const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;

const ForeignMethodEntry = struct {
    signature: []const u8,
    func: WrenForeignMethodFn,
};

const ClassMethods = struct {
    class_name: []const u8,
    methods: []const ForeignMethodEntry,
};

const ModuleMethods = struct {
    module_name: []const u8,
    classes: []const ClassMethods,
};

fn wren_count(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, count);
}

fn wren_delete(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, count);
}

fn wren_plusone(vm: ?*wren.WrenVM) callconv(.C) void {
    wren.wrenSetSlotDouble(vm, 0, wren.wrenGetSlotDouble(vm, 1) + 1);
}

fn loadModuleComplete(vm: ?*wren.WrenVM, name: [*c]const u8, result: wren.WrenLoadModuleResult) callconv(.c) void {
    _ = .{ vm, name };
    if (result.source == null) return;
}

fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    _ = .{ vm, name };
    if (std.mem.eql(u8, "io", std.mem.span(name))) {
        return .{
            .source = io,
            .onComplete = loadModuleComplete,
        };
    }

    return .{
        .source = null,
        .onComplete = null,
    };
}

fn bindForeignMethod(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8, isStatic: bool, signature: [*c]const u8) callconv(.c) ?*const WrenForeignMethodFn {
    _ = .{ vm, module, className, isStatic, signature };

    if (std.mem.eql(u8, "main", std.mem.span(module))) {
        if (std.mem.eql(u8, "FFI", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "count()")) {
                return wren_count;
            } else {
                return wren_plusone;
            }
        }
    }

    if (std.mem.eql(u8, "io", std.mem.span(module))) {
        if (std.mem.eql(u8, "Directory", std.mem.span(className))) {
            if (std.mem.eql(u8, std.mem.span(signature), "delete()")) {
                return wren_delete;
            } else {
                return wren_plusone;
            }
        }
    }
    return null;
}

pub fn main() !void {
    std.debug.print("Zig Version \n", .{});
    const module: [*:0]const u8 = "main";
    const script = @embedFile("main.wren");

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = writeFn;
    config.errorFn = errorFn;

    config.bindForeignMethodFn = bindForeignMethod;

    config.loadModuleFn = loadModule;

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const result = wren.wrenInterpret(vm, module, script);

    switch (result) {
        wren.WREN_RESULT_COMPILE_ERROR => {
            std.debug.print("Compile Error!\n", .{});
        },
        wren.WREN_RESULT_RUNTIME_ERROR => {
            std.debug.print("Runtime Error!\n", .{});
        },
        wren.WREN_RESULT_SUCCESS => {
            std.debug.print("Success!\n", .{});
        },
        else => {},
    }
}
