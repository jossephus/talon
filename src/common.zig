const std = @import("std");
const builtin = @import("builtin");
const wren = @cImport({
    @cInclude("wren.h");
    @cInclude("stdio.h");
});
const c = if (builtin.os.tag == .windows) @cImport({
    @cInclude("windows.h");
}) else @cImport({
    @cInclude("dlfcn.h");
});

pub const r = @cImport({
    @cInclude("raylib.h");
    @cInclude("raymath.h");
    @cInclude("rlgl.h");
});

const Bindings = @import("bindings/index.zig");

const raylib = @embedFile("bindings/raylib.wren");
const math = @embedFile("bindings/math.wren");
const embed = @embedFile("bindings/embed.wren");

//var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
//pub const allocator = debug_allocator.allocator();

var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
//pub const allocator = debug_allocator.allocator();
pub const allocator = if (builtin.target.cpu.arch.isWasm()) std.heap.wasm_allocator else debug_allocator.allocator();

pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;
//var map = std.StringHashMap(*const fn (?*wren.WrenVM) callconv(.c) void).init(
//allocator,
//);
var map = std.StringHashMap([]const u8).init(
    allocator,
);

const Handle = if (builtin.os.tag == .windows) c.HMODULE else ?*anyopaque;
var main_program_handle: Handle = null;

pub fn initDynamicSymbolHandling() void {
    if (builtin.os.tag == .windows) {
        // On Windows, get a handle to the .exe instance.
        // The 'A' stands for ANSI (char*), which matches our []const u8 strings.
        main_program_handle = c.GetModuleHandleA(null);
    } else {
        // On POSIX, a null path gives a handle to the global symbol namespace.
        main_program_handle = c.dlopen(null, c.RTLD_LAZY);
    }

    if (main_program_handle == null) {
        std.log.err("DynamicSymbols: Could not get a handle to the main program.", .{});
    }
}

pub fn bindForiegnClass(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8) callconv(.c) wren.WrenForeignClassMethods {
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

pub fn bindForeignMethod(vm: ?*wren.WrenVM, module: [*c]const u8, className: [*c]const u8, isStatic: bool, signature: [*c]const u8) callconv(.c) ?*const Bindings.WrenForeignMethodFn {
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

    // Lets check if it is loaded dynamically
    const load_method = map.get(name) orelse null;

    if (load_method) |method| {
        if (builtin.os.tag == .windows) {
            const libname = "add.dll";

            const handle = c.LoadLibraryA(libname.ptr);
            if (handle == null) {
                std.debug.print("Failed to load DLL: {s}\n", .{libname});
                return null;
            }

            const symbol_name = "wren_c_embed_add";
            const add_fn_ptr = c.GetProcAddress(handle, symbol_name.ptr);

            if (add_fn_ptr == null) {
                std.debug.print("Failed to find symbol: {s}\n", .{symbol_name});
                return null;
            }

            return @ptrFromInt(@intFromPtr(add_fn_ptr));

            //std.debug.print("Load method: {s} \n", .{method});
            //const proc = c.GetProcAddress(main_program_handle, method.ptr);
            //std.debug.print("Proc is {any}", .{proc});
            //return @ptrFromInt(@intFromPtr(proc));
        } else {
            const proc = c.dlsym(main_program_handle, method.ptr);
            std.debug.print("Proc is {any}\n", .{proc});
            return @ptrFromInt(@intFromPtr(c.dlsym(main_program_handle, method.ptr)));
        }

        //return method;
    }

    std.debug.print("Module {s}\n", .{mod});
    std.log.err("Could not find binding for .{s}", .{name});

    return null;
}

pub fn writeFn(vm: ?*wren.WrenVM, text: [*c]const u8) callconv(.C) void {
    _ = vm;
    std.debug.print("{s}", .{text});
}

pub fn errorFn(
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

pub fn loadModuleComplete(vm: ?*wren.WrenVM, name: [*c]const u8, result: wren.WrenLoadModuleResult) callconv(.c) void {
    _ = .{ vm, name };
    if (result.source == null) return;
}

pub fn loadBuiltinModule(name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
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

    if (std.mem.eql(u8, "embed", std.mem.span(name))) {
        return .{
            .source = embed,
            .onComplete = loadModuleComplete,
        };
    }

    return .{
        .source = null,
        .onComplete = null,
    };
}

pub fn loadModule(vm: ?*wren.WrenVM, name: [*c]const u8) callconv(.c) wren.WrenLoadModuleResult {
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

pub fn isRelative(path: []const u8) bool {
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

pub fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.C) ?[*:0]const u8 {
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

pub fn finalize_binding_foreign_classes(data: ?*anyopaque) callconv(.c) void {
    // TODO: we are using the same finlizer for everyone, this will be changed if i ever get any usecase
    // to use finalizer for
    _ = .{data};
}

pub fn wren_load_foreign_function(vm: ?*wren.WrenVM) callconv(.C) void {
    _ = .{vm};

    const @"1" = std.mem.span(wren.wrenGetSlotString(vm, 1)); // name
    const @"2" = std.mem.span(wren.wrenGetSlotString(vm, 2)); // C function names

    std.debug.print("Load method: {s} {s}\n", .{ @"1", @"2" });
    _ = .{ @"1", @"2" };
    map.put(@"1", @"2") catch unreachable;
}
