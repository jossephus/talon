const std = @import("std");
const common = @import("common.zig");
const wren = common.wren;
const allocator = common.allocator;

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

pub fn resolveModule(vm: ?*wren.WrenVM, importer: [*c]const u8, module: [*c]const u8) callconv(.c) ?[*:0]const u8 {
    _ = .{ importer, module, vm };
    const imp = std.mem.span(importer);
    const mod = std.mem.span(module);
    //std.debug.print("Importer: {s}\n", .{mod});

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
