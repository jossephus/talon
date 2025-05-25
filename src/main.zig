const std = @import("std");
const builtin = @import("builtin");

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

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
const allocator = debug_allocator.allocator();

const raylib = @embedFile("bindings/raylib.wren");
const math = @embedFile("bindings/math.wren");

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

fn loadModuleComplete(vm: ?*wren.WrenVM, name: [*c]const u8, result: wren.WrenLoadModuleResult) callconv(.c) void {
    _ = .{ vm, name };
    if (result.source == null) return;
}

fn loadBuiltinModule(name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    if (std.mem.eql(u8, "raylib", std.mem.span(name))) {
        return .{
            .source = raylib,
            .onComplete = loadModuleComplete,
        };
    }

    if (std.mem.eql(u8, "math", std.mem.span(name))) {
        return .{
            .source = math,
            .onComplete = loadModuleComplete,
        };
    }
    return .{
        .source = null,
        .onComplete = null,
    };
}

fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    _ = .{ vm, name };
    const mod = std.mem.span(name);

    if (!std.fs.path.isAbsolute(mod) and !isRelative(mod)) {
        return loadBuiltinModule(name);
    }

    const path = std.mem.concat(allocator, u8, &[_][]const u8{ std.mem.span(name), ".wren" }) catch return .{
        .source = null,
        .onComplete = null,
    };

    defer allocator.free(path);

    // TODO: There is a lot of noise here
    var file: std.fs.File = undefined;
    if (isRelative(mod)) {
        file = std.fs.cwd().openFile(path, .{}) catch |err| {
            std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), path });
            return .{
                .source = null,
                .onComplete = null,
            };
        };
    } else {
        file = std.fs.openFileAbsolute(path, .{ .mode = .read_write }) catch |err| {
            std.log.err("Failed to open file: {s} {s}\n", .{ path, @errorName(err) });
            return .{
                .source = null,
                .onComplete = null,
            };
        };
    }

    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [8192]u8 = undefined;

    const read = in_stream.readAll(&script) catch {
        return .{
            .source = null,
            .onComplete = null,
        };
    };
    script[read] = 0;

    const source = allocator.dupeZ(u8, &script) catch return .{
        .source = null,
        .onComplete = null,
    };

    return .{
        .source = source,
        .onComplete = loadModuleComplete,
    };
}

fn isRelative(path: []const u8) bool {
    if (path.len < 2) {
        return false;
    }

    if (path[0] == '.' and std.fs.path.isSep(path[1])) {
        return true;
    }

    if (path[0] == '.' and path[1] == '.' and std.fs.path.isSep(path[1])) {
        return true;
    }

    return false;
}

fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.C) ?[*:0]const u8 {
    _ = .{ importer, module, vm };
    const imp = std.mem.span(importer);
    const mod = std.mem.span(module);

    if (!std.fs.path.isAbsolute(mod) and !isRelative(mod)) {
        return module;
    }

    // TODO: There is a lot of noise here
    if (isRelative(mod)) {
        const resolved =
            std.fs.path.resolvePosix(allocator, &[_][]const u8{
                std.fs.path.dirname(imp).?,
                mod,
            }) catch return null;

        const final = if (std.mem.startsWith(u8, resolved, "." ++ std.fs.path.sep_str)) resolved else std.mem.concat(allocator, u8, &[_][]const u8{ ".", "/", resolved }) catch |err| {
            std.log.err("Failed to open file: {s} \n", .{@errorName(err)});
            return null;
        };

        std.debug.print("Importer {s}\n", .{final});
        const path = allocator.dupeZ(u8, resolved) catch |err| {
            std.log.err("Failed to open file: {s}\n", .{@errorName(err)});
            return null;
        };
        _ = path;
        return module;
    }
    return module;
}

fn finalize_binding_foreign_classes(data: ?*anyopaque) callconv(.c) void {
    // TODO: we are using the same finlizer for everyone, this will be changed if i ever get any usecase
    // to use finalizer for
    _ = .{data};
}

fn bindForiegnClass(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8) callconv(.c) wren.WrenForeignClassMethods {
    _ = .{ vm, module, className };
    var methods: wren.WrenForeignClassMethods = .{
        .allocate = null,
        .finalize = null,
    };

    const mod = std.mem.span(module);
    const class = std.mem.span(className);

    const name = std.mem.concat(allocator, u8, &[_][]const u8{
        mod, ".", class,
    }) catch unreachable;

    const foreign_class_binding = Bindings.ForeignClassBindings.get(name) orelse null;

    if (foreign_class_binding) |binding| {
        methods.allocate = binding.allocate;
        methods.finalize = finalize_binding_foreign_classes;
    }

    return methods;
}

fn bindForeignMethod(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8, isStatic: bool, signature: [*c]const u8) callconv(.c) ?*const Bindings.WrenForeignMethodFn {
    _ = .{ vm, module, className, isStatic, signature };

    const mod = std.mem.span(module);
    const class = std.mem.span(className);
    const sign = std.mem.span(signature);

    const name = std.mem.concat(allocator, u8, &[_][]const u8{
        mod, ".", class, ".", sign,
    }) catch unreachable;

    defer allocator.free(name);

    const binding_method = Bindings.ForeignMethodBindings.get(name) orelse null;

    if (binding_method) |method| {
        return method;
    }

    std.debug.print("Module {s}\n", .{mod});
    std.log.err("Could not find binding for .{s}", .{name});

    return null;
}

pub fn main() !void {
    //const script = @embedFile("main.wren");

    const args = std.process.argsAlloc(allocator) catch unreachable;
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        @panic("We require a wren script to run");
    }
    const module: [*:0]const u8 = args[1];
    //const script = args[1];

    const file = std.fs.cwd().openFile(args[1], .{}) catch |err| {
        std.log.err("Failed to open file: {s} {s}\n", .{ @errorName(err), args[1] });
        return;
    };
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var script: [std.fs.max_path_bytes]u8 = undefined;

    const read = try in_stream.readAll(&script);
    script[read] = 0;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = writeFn;
    config.errorFn = errorFn;

    config.bindForeignClassFn = bindForiegnClass;
    config.bindForeignMethodFn = bindForeignMethod;

    config.resolveModuleFn = resolveModule;
    config.loadModuleFn = loadModule;

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const source_code: [*c]const u8 = @ptrCast(&script);

    const result = wren.wrenInterpret(vm, module, source_code);

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
