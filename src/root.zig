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

var wrenFilesMap: std.StaticStringMap([]const u8) = undefined;

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
pub const allocator = if (builtin.target.cpu.arch.isWasm()) std.heap.wasm_allocator else debug_allocator.allocator();

pub fn run(mainFile: []const u8, embeddedFilesMap: std.StaticStringMap([]const u8)) !void {
    common.initDynamicSymbolHandling();

    const args = std.process.argsAlloc(allocator) catch unreachable;
    defer std.process.argsFree(allocator, args);

    wrenFilesMap = embeddedFilesMap;

    const module: [*:0]const u8 = @ptrCast(mainFile);
    const formalized = try formalizeImport(std.mem.span(module));

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = common.writeFn;
    config.errorFn = common.errorFn;

    config.bindForeignClassFn = common.bindForiegnClass;
    config.bindForeignMethodFn = common.bindForeignMethod;

    config.resolveModuleFn = resolveModule;
    config.loadModuleFn = loadModule;

    const source_code: [*c]const u8 = @ptrCast(wrenFilesMap.get(formalized).?);

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const result = wren.wrenInterpret(vm, "main", source_code);

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

fn formalizeImport(module: []const u8) ![]const u8 {
    const abc = try std.fmt.allocPrint(allocator, "{s}", .{module});
    return abc;
}

pub fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
    _ = .{ vm, name };
    const mod = std.mem.span(name);

    if (!std.fs.path.isAbsolute(mod) and !common.isRelative(mod)) {
        return common.loadBuiltinModule(name);
    }

    const path = std.mem.concat(allocator, u8, &[_][]const u8{ std.mem.span(name), ".wren" }) catch return .{
        .source = null,
        .onComplete = null,
    };

    defer allocator.free(path);

    // TODO: There is a lot of noise here
    var file: std.fs.File = undefined;
    if (common.isRelative(mod)) {
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
        .onComplete = common.loadModuleComplete,
    };
}

pub fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.C) ?[*:0]const u8 {
    _ = .{ importer, module, vm };
    const imp = std.mem.span(importer);
    const mod = std.mem.span(module);

    if (!std.fs.path.isAbsolute(mod) and !common.isRelative(mod)) {
        return module;
    }
    _ = .{ imp, mod };

    return module;
}
