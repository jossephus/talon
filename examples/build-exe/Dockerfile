# took inspiration from https://github.com/QSmally/Zig-Build/blob/master/Dockerfile
# 
FROM alpine AS compiler

ARG VERSION=0.14.0

RUN apk update && apk add curl tar xz

RUN curl https://ziglang.org/download/$VERSION/zig-linux-$(uname -m)-$VERSION.tar.xz -O && \
    tar -xf *.tar.xz && \
    mv zig-linux-$(uname -m)-$VERSION /compiler

WORKDIR /build
COPY . /build

RUN echo '.{' \
    '    .name = .build_exe,' \
    '    .version = "0.0.0",' \
    '    .fingerprint = 0x7aca45f40a314ba8,' \
    '    .minimum_zig_version = "0.14.0",' \
    '    .dependencies = .{' \
    '        .wren = .{' \
    '            .url = "https://github.com/wren-lang/wren/archive/refs/heads/main.zip",' \
    '            .hash = "N-V-__8AAPbpYgAZgdr-sM49A18GSKr5MVR56MwpfI65FmAZ",' \
    '        },' \
    '        .raylib = .{' \
    '            .url = "git+https://github.com/raysan5/raylib#27a4fe885164b315a90b67682f981a1e03d6079c",' \
    '            .hash = "raylib-5.5.0-whq8uFqtNARw6t1tTakBDSVYgUjlBqnDppOyNfE_yfCa",' \
    '        },' \
    '        .tolan = .{' \
    '            .url = "git+https://github.com/jossephus/talon#ec9dc6910fa96c414406b5ed539e441943e4aadd",' \
    '            .hash = "zig_wren-0.0.0-_Mx4iLclCACui2mzMF9z9j7iRplB0vS_jZjf-k9EQNLC",' \
    '        },' \
    '    },' \
    '    .paths = .{' \
    '        "build.zig",' \
    '        "build.zig.zon",' \
    '        "src",' \
    '    },' \
    '}' > build.zig.zon

RUN cat <<'EOF' > build.zig
const std = @import("std");

const mainFile = "main.wren";

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const tolan_lib = b.dependency("tolan", .{
        .target = target,
        .optimize = optimize,
    });
    const tolan_mod = tolan_lib.module("tolan");

    const exe_mod = b.createModule(.{
        .root_source_file = b.path("build.zig"),
        .target = target,
        .optimize = optimize,
    });

    exe_mod.addImport("tolan", tolan_mod);

    const tolan_exe = b.addExecutable(.{
        .name = "camera",
        .root_module = exe_mod,
    });

    try addAssetsOption(b, tolan_exe, target, optimize, b.getInstallStep());

    b.installArtifact(tolan_exe);

    const run_cmd = b.addRunArtifact(tolan_exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

pub fn addAssetsOption(b: *std.Build, exe: anytype, target: anytype, optimize: anytype, step: *std.Build.Step) !void {
    var options = b.addOptions();

    var files = std.ArrayList([]const u8).init(b.allocator);
    defer files.deinit();

    try checkWrenFiles(b.allocator, &files, b, ".", ".", step);

    options.addOption([]const []const u8, "files", files.items);
    exe.step.dependOn(&options.step);

    const assets_mod = b.addModule("assets", .{
        .root_source_file = options.getOutput(),
        .target = target,
        .optimize = optimize,
    });

    exe.root_module.addImport("assets", assets_mod);
}

fn checkWrenFiles(
    allocator: std.mem.Allocator,
    files: *std.ArrayList([]const u8),
    b: *std.Build,
    base_path: []const u8,
    rel_path: []const u8,
    step: *std.Build.Step,
) !void {
    var dir = try std.fs.cwd().openDir(rel_path, .{ .iterate = true });
    var it = dir.iterate();
    while (try it.next()) |entry| {
        if (std.mem.eql(u8, entry.name, ".zig-cache") or std.mem.eql(u8, entry.name, "zig-out")) {
            continue;
        }
        const rel_to_base = try std.fs.path.join(allocator, &.{ rel_path, entry.name });
        defer allocator.free(rel_to_base);

        switch (entry.kind) {
            .file => {
                if (std.mem.endsWith(u8, entry.name, ".wren")) {
                    const rel = try std.fs.path.relative(allocator, base_path, rel_to_base);
                    defer allocator.free(rel);

                    try files.append(b.dupe(rel));
                }
            },
            .directory => {
                try checkWrenFiles(allocator, files, b, base_path, rel_to_base, step);
            },
            else => {},
        }
    }
}

const assets = @import("assets");

const embeddedFilesMap = std.StaticStringMap([]const u8).initComptime(genMap());
const EmbeddedAsset = struct {
    []const u8,
    []const u8,
};

fn genMap() [assets.files.len]EmbeddedAsset {
    var embassets: [assets.files.len]EmbeddedAsset = undefined;
    comptime var i = 0;
    inline for (assets.files) |file| {
        embassets[i][0] = file;
        embassets[i][1] = @embedFile(file);
        i += 1;
    }
    return embassets;
}

pub fn main() !void {
    try tolan.run(mainFile, embeddedFilesMap);
}

const tolan = @import("tolan");
EOF

# RUN /compiler/zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-windows
#RUN /compiler/zig build -Dtarget=x86_64-windows
