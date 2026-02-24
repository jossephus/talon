const std = @import("std");
const builtin = @import("builtin");
const common = @import("common.zig");
const wren = common.wren;
pub const r = common.r;

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
    const root_module = if (std.mem.endsWith(u8, formalized, ".wren"))
        formalized[0 .. formalized.len - ".wren".len]
    else
        formalized;

    var config: wren.WrenConfiguration = undefined;
    wren.wrenInitConfiguration(&config);
    config.writeFn = common.writeFn;
    config.errorFn = common.errorFn;

    config.bindForeignClassFn = common.bindForiegnClass;
    config.bindForeignMethodFn = common.bindForeignMethod;

    config.resolveModuleFn = resolveModule;
    config.loadModuleFn = loadModule;

    const source_text = wrenFilesMap.get(formalized) orelse {
        std.log.err("Failed to find embedded main module: {s}", .{formalized});
        return error.ModuleNotFound;
    };
    const source_code: [*c]const u8 = @ptrCast(source_text);
    const root_module_z = try allocator.dupeZ(u8, root_module);
    defer allocator.free(root_module_z);

    const vm = wren.wrenNewVM(&config);
    defer wren.wrenFreeVM(vm);

    const result = wren.wrenInterpret(vm, root_module_z, source_code);

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
    _ = vm;
    const mod = std.mem.span(name);

    const has_sep = std.mem.indexOfScalar(u8, mod, '/') != null or std.mem.indexOfScalar(u8, mod, '\\') != null;
    if (!std.fs.path.isAbsolute(mod) and !common.isRelative(mod) and !has_sep) {
        return common.loadBuiltinModule(name);
    }

    // Check embedded files first
    const path = std.mem.concat(allocator, u8, &[_][]const u8{ mod, ".wren" }) catch return .{
        .source = null,
        .onComplete = null,
    };
    defer allocator.free(path);

    // Try embedded map first
    if (wrenFilesMap.get(path)) |embedded_source| {
        const source = allocator.dupeZ(u8, embedded_source) catch return .{
            .source = null,
            .onComplete = null,
        };
        return .{
            .source = source,
            .onComplete = common.loadModuleComplete,
        };
    }

    if (std.mem.startsWith(u8, path, "./")) {
        const normalized_path = path[2..];
        if (wrenFilesMap.get(normalized_path)) |embedded_source| {
            const source = allocator.dupeZ(u8, embedded_source) catch return .{
                .source = null,
                .onComplete = null,
            };
            return .{
                .source = source,
                .onComplete = common.loadModuleComplete,
            };
        }
    }

    // Fall back to filesystem
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
        file = std.fs.openFileAbsolute(path, .{ .mode = .read_only }) catch |err| {
            std.log.err("Failed to open file: {s} {s}\n", .{ path, @errorName(err) });
            return .{
                .source = null,
                .onComplete = null,
            };
        };
    }

    defer file.close();

    const script = file.readToEndAlloc(allocator, 1024 * 1024) catch {
        return .{
            .source = null,
            .onComplete = null,
        };
    };
    defer allocator.free(script);

    const source = allocator.dupeZ(u8, script) catch return .{
        .source = null,
        .onComplete = null,
    };

    return .{
        .source = source,
        .onComplete = common.loadModuleComplete,
    };
}

pub fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.c) ?[*:0]const u8 {
    _ = vm;
    const imp = std.mem.span(importer);
    const mod = std.mem.span(module);

    if (!std.fs.path.isAbsolute(mod) and !common.isRelative(mod)) {
        return dupeZC(mod) orelse module;
    }

    // Resolve relative imports
    if (common.isRelative(mod)) {
        const importer_dir = std.fs.path.dirname(imp) orelse ".";
        const resolved = std.fs.path.resolvePosix(allocator, &.{ importer_dir, mod }) catch return module;
        defer allocator.free(resolved);

        const result = dupeZC(resolved) orelse return module;
        return result;
    }

    return dupeZC(mod) orelse module;
}

fn dupeZC(value: []const u8) ?[*:0]const u8 {
    const buf = std.c.malloc(value.len + 1) orelse return null;
    const out: [*]u8 = @ptrCast(buf);
    @memcpy(out[0..value.len], value);
    out[value.len] = 0;
    return @ptrCast(out);
}
