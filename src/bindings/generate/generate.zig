const std = @import("std");
const headers = @import("rcore.zig").headers;

const WrenArgType = union(enum) {
    Double,
    Float,
    Int,
    UInt,
    String,
    Bool,
    Void,
    Other: []const u8,
};

const RaylibHeaderSignature = struct {
    allocator: std.mem.Allocator,
    return_type: WrenArgType,
    fn_name: []const u8,
    raylib_name: []const u8,
    args: []WrenArgType,

    // Given a C raylib function header it generates RaylibHeaderSignature
    // Started by me and finished by chatgpt as it got boring :-)
    fn new(allocator: std.mem.Allocator, line: []const u8) !?RaylibHeaderSignature {
        const comment_index = std.mem.indexOf(u8, line, "//") orelse line.len;
        const line_no_comment = line[0..comment_index];
        const signature = std.mem.trim(u8, line_no_comment, " \t\n");

        const open_paren = std.mem.indexOf(u8, signature, "(") orelse return null;
        const close_paren = std.mem.indexOf(u8, signature, ")") orelse return null;
        const before_paren = signature[0..open_paren];
        const args_section = signature[open_paren + 1 .. close_paren];

        var before_iter = std.mem.splitAny(u8, std.mem.trim(u8, before_paren, " "), " ");
        var return_type_buf = std.ArrayList(u8).init(allocator);
        var fn_name_buf = std.ArrayList(u8).init(allocator);

        while (before_iter.next()) |part| {
            if (before_iter.peek() == null) {
                try fn_name_buf.appendSlice(part);
            } else {
                try return_type_buf.appendSlice(part);
                try return_type_buf.append(' ');
            }
        }

        const return_type = try get_arg_type(std.mem.trim(u8, return_type_buf.items, " "));
        const fn_name_camel = fn_name_buf.items;
        const fn_name_snake = try camel_to_snake(allocator, fn_name_camel);

        // Parse arguments
        var args = std.ArrayList(WrenArgType).init(allocator);
        var args_iter = std.mem.splitAny(u8, args_section, ",");

        while (args_iter.next()) |arg| {
            const trimmed = std.mem.trim(u8, arg, " \t");
            if (trimmed.len == 0 or std.mem.eql(u8, trimmed, "void")) continue;

            var word_iter = std.mem.splitAny(u8, trimmed, " ");
            var words = std.ArrayList([]const u8).init(allocator);

            while (word_iter.next()) |word| {
                if (word.len > 0)
                    try words.append(word);
            }

            if (words.items.len == 0) continue;

            var type_parts: []const []const u8 = undefined;
            if (words.items.len > 1) {
                type_parts = words.items[0 .. words.items.len - 1];
            } else {
                type_parts = words.items;
            }

            var type_buf = std.ArrayList(u8).init(allocator);
            for (type_parts, 0..) |part, i| {
                if (i > 0) try type_buf.append(' ');
                try type_buf.appendSlice(part);
            }

            const a = try type_buf.toOwnedSlice();

            try args.append(try get_arg_type(a));
        }

        const fn_name = std.mem.trim(u8, fn_name_snake, "*_");

        return RaylibHeaderSignature{
            .allocator = allocator,
            .return_type = return_type,
            .fn_name = fn_name,
            .args = args.items,
            .raylib_name = std.mem.trim(u8, fn_name_camel, "*"),
        };
    }
};

fn camel_to_snake(allocator: std.mem.Allocator, input: []const u8) ![]u8 {
    var buf = std.ArrayList(u8).init(allocator);
    for (input, 0..) |c, i| {
        if (std.ascii.isUpper(c)) {
            if (i != 0) try buf.append('_');
            try buf.append(std.ascii.toLower(c));
        } else {
            try buf.append(c);
        }
    }
    return buf.toOwnedSlice();
}

fn get_arg_type(a: []const u8) !WrenArgType {
    const mappings = [_]struct {
        key: []const u8,
        value: WrenArgType,
    }{
        .{ .key = "int", .value = WrenArgType.Int },
        .{ .key = "unsigned int", .value = WrenArgType.UInt },
        .{ .key = "long", .value = WrenArgType.Int },
        .{ .key = "float", .value = WrenArgType.Float },
        .{ .key = "double", .value = WrenArgType.Double },
        .{ .key = "char", .value = WrenArgType.String },
        .{ .key = "unsigned char", .value = WrenArgType.String },
        .{ .key = "const char", .value = WrenArgType.String },
        .{ .key = "const unsigned char", .value = WrenArgType.String },
        .{ .key = "bool", .value = WrenArgType.Bool },
        .{ .key = "void", .value = WrenArgType.Void },
    };

    for (mappings) |m| {
        if (std.mem.eql(u8, m.key, a)) {
            return m.value;
        }
    }

    return WrenArgType{ .Other = a };
}

fn toLowerCamelCase(allocator: std.mem.Allocator, input: []const u8) ![]const u8 {
    if (input.len == 0) return input;

    var result = try allocator.alloc(u8, input.len);
    result[0] = std.ascii.toLower(input[0]);
    @memcpy(result[1..], input[1..]);
    return result;
}

pub fn main() !void {
    var tokenized = std.mem.tokenizeAny(u8, headers, "\n");
    const allocator = std.heap.page_allocator;

    var zig_program = std.ArrayList(u8).init(allocator);
    defer zig_program.deinit();

    var wren_source = std.ArrayList(u8).init(allocator);
    defer wren_source.deinit();

    var binding_source = std.ArrayList(u8).init(allocator);
    defer binding_source.deinit();

    try zig_program.appendSlice(
        \\const std = @import("std");
        \\const wren = @cImport({
        \\   @cInclude("wren.h");
        \\   @cInclude("stdio.h");
        \\});
        \\const r = @cImport({
        \\   @cInclude("raylib.h");
        \\   @cInclude("raymath.h");
        \\   @cInclude("rlgl.h");
        \\});
        \\
        \\pub const RaylibBindings = @This();
        \\
        \\
    );

    try wren_source.appendSlice(
        \\class Raylib {
        \\
    );

    try binding_source.appendSlice(
        \\pub const WrenForeignMethodFn = fn (?*wren.WrenVM) callconv(.c) void;
        \\pub const ForeignMethodBindings = std.StaticStringMap(?*const WrenForeignMethodFn).initComptime(.{
        \\
    );

    while (tokenized.next()) |line| {
        const signature = try RaylibHeaderSignature.new(allocator, line);

        if (signature) |sign| {
            var b: [600]u8 = undefined;
            const name = try std.fmt.bufPrint(&b,
                \\pub fn wren_raylib_{s}(vm: ?*wren.WrenVM) callconv(.C) void  {c}
                \\    _ = .{c}vm{c};
                \\
            , .{ sign.fn_name, '{', '{', '}' });

            try zig_program.appendSlice(name);
            b = undefined;

            const wren_func_name = try std.fmt.bufPrint(&b,
                \\ foreign static {s}(
            , .{try toLowerCamelCase(allocator, sign.raylib_name)});

            try wren_source.appendSlice(wren_func_name);

            b = undefined;

            const binding = try std.fmt.bufPrint(&b, ".{{ \"raylib.Raylib.{s}{s}\", wren_raylib_{s}}},\n", .{ try toLowerCamelCase(allocator, sign.raylib_name), try format_binding_call(allocator, sign.args.len), sign.fn_name });

            try binding_source.appendSlice(binding);

            b = undefined;

            for (sign.args, 0..) |arg, i| {
                b = undefined;
                if (sign.args.len > 1 and i < sign.args.len - 1) {
                    try wren_source.appendSlice(try std.fmt.bufPrint(&b,
                        \\{c},
                    , .{@as(u8, @intCast(i + 'a'))}));
                }
                switch (arg) {
                    .Int => {
                        // const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}": c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, {d}));
                            \\
                        , .{ i, i + 1 }));
                    },
                    .Double => {
                        // const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}" = wren.wrenGetSlotDouble(vm, {d});
                            \\
                        , .{ i, i + 1 }));
                    },
                    .Float => {
                        // const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}" = @as(f32, @floatCast(wren.wrenGetSlotDouble(vm, {d})));
                            \\
                        , .{ i, i + 1 }));
                    },
                    .UInt => {
                        // const width: c_int = @intFromFloat(wren.wrenGetSlotDouble(vm, 1));
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}": c_uint = @intFromFloat(wren.wrenGetSlotDouble(vm, {d}));
                            \\
                        , .{ i, i + 1 }));
                    },
                    .String => {
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}" = wren.wrenGetSlotString(vm, {d});
                            \\
                        , .{ i, i + 1 }));
                    },
                    .Other => |val| {
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const foreign_{d} = wren.wrenGetSlotForeign(vm, {d});
                            \\    const ptr_{d}: ?*r.{s} = @alignCast(@ptrCast(foreign_{d}));
                            \\    const @"{d}": r.{s} = ptr_{d}.?.*;
                            \\
                        , .{ i, i + 1, i, val, i, i, val, i }));
                    },
                    .Bool => {
                        try zig_program.appendSlice(try std.fmt.bufPrint(&b,
                            \\    const @"{d}" = wren.wrenGetSlotBool(vm, {d});
                            \\
                        , .{ i, i + 1 }));
                    },
                    .Void => {},
                }
            }
            // To remove trailing comma at the end of the function name
            if (sign.args.len != 0)
                try wren_source.appendSlice(try std.fmt.bufPrint(&b,
                    \\{c})
                    \\
                , .{@as(u8, @intCast(sign.args.len - 1 + 'a'))}))
            else
                try wren_source.appendSlice(try std.fmt.bufPrint(&b,
                    \\)
                    \\
                , .{}));

            b = undefined;

            try zig_program.appendSlice(try format_call(allocator, sign));
            try zig_program.appendSlice("\n} \n\n");
            //std.debug.print("{any}\n", .{sign.args});
        }
        //try(line, allocator);
    }
    try wren_source.appendSlice("\n} \n\n");
    try binding_source.appendSlice(
        \\ });
        \\ 
        \\ pub const ForeignClass = struct { allocate: ?*const WrenForeignClassAllocatorFn };
        \\ 
        \\ pub const ForeignClassBindings = std.StaticStringMap(ForeignClass).initComptime(.{
        \\    .{ "raylib.Color", ForeignClass{ .allocate = Color.allocate } },
        \\    .{ "raylib.RenderTexture2D", ForeignClass{ .allocate = RenderTexture2D.allocate } },
        \\    .{ "raylib.Camera2D", ForeignClass{ .allocate = Camera2D.allocate } },
        \\    .{ "raylib.Vector2", ForeignClass{ .allocate = Vector2.allocate } },
        \\    .{ "raylib.Rectangle", ForeignClass{ .allocate = Rectangle.allocate } },
        \\ });
    );

    const stdout = std.io.getStdOut().writer();
    try stdout.print("{s}\n", .{try zig_program.toOwnedSlice()});
    try stdout.print("{s}\n", .{try binding_source.toOwnedSlice()});
    //try stdout.print("{s}\n", .{try wren_source.toOwnedSlice()});
}

fn format_call(allocator: std.mem.Allocator, sign: RaylibHeaderSignature) ![]const u8 {
    var arg_buf = std.ArrayList(u8).init(allocator);
    defer arg_buf.deinit();

    for (0..sign.args.len) |i| {
        if (i != 0) try arg_buf.appendSlice(", ");
        try arg_buf.writer().print("@\"{d}\"", .{i});
    }

    return switch (sign.return_type) {
        .Void => try std.fmt.allocPrint(allocator,
            \\    r.{s}({s});
        , .{ sign.raylib_name, arg_buf.items }),
        .Bool => try std.fmt.allocPrint(allocator,
            \\    wren.wrenSetSlotBool(vm, 0, r.{s}({s}));
        , .{ sign.raylib_name, arg_buf.items }),
        .Int, .UInt => try std.fmt.allocPrint(allocator,
            \\    wren.wrenSetSlotDouble(vm, 0, @as(f32, @floatFromInt(r.{s}({s}))));
        , .{ sign.raylib_name, arg_buf.items }),
        .Double => try std.fmt.allocPrint(allocator,
            \\    wren.wrenSetSlotDouble(vm, 0, r.{s}({s}));
        , .{ sign.raylib_name, arg_buf.items }),
        .Float => try std.fmt.allocPrint(allocator,
            \\    wren.wrenSetSlotDouble(vm, 0, r.{s}({s}));
        , .{ sign.raylib_name, arg_buf.items }),
        .String => try std.fmt.allocPrint(allocator,
            \\    wren.wrenSetSlotString(vm, 0, r.{s}({s}));
        , .{ sign.raylib_name, arg_buf.items }),
        .Other => |name| blk: {
            break :blk try std.fmt.allocPrint(allocator,
                \\    const foreign_ptr = wren.wrenSetSlotNewForeign(vm, 0, 0, @sizeOf(r.{s}));
                \\
                \\    const ptr: *r.{s} = @alignCast(@ptrCast(foreign_ptr));
                \\    ptr.* = r.{s}({s});
            , .{ name, name, sign.raylib_name, arg_buf.items });
        },
    };
}

fn format_binding_call(allocator: std.mem.Allocator, size: usize) ![]const u8 {
    var arg_buf = std.ArrayList(u8).init(allocator);
    defer arg_buf.deinit();

    try arg_buf.append('(');

    for (0..size) |i| {
        if (i != 0) try arg_buf.appendSlice(",_") else try arg_buf.append('_');
    }

    try arg_buf.append(')');

    return arg_buf.toOwnedSlice();
}

// Unhandled Cases
//
//    void SetShaderValue(Shader shader, int locIndex, const void *value, int uniformType);      // Set shader uniform value
//    void SetShaderValueV(Shader shader, int locIndex, const void *value, int uniformType, int count); // Set shader uniform value vector
//    void *GetWindowHandle(void);                             // Get native window handle
//    #define GetMouseRay GetScreenToWorldRay      // Compatibility hack for previous raylib versions
//    void *MemRealloc(void *ptr, unsigned int size);            // Internal memory reallocator
//    void MemFree(void *ptr);                                   // Internal memory free
//    bool SaveFileData(const char *fileName, void *data, int dataSize); // Save data to file from byte array (write), returns true on success
