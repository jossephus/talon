const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    if (target.result.cpu.arch.isWasm()) {
        const wasm_target = b.resolveTargetQuery(.{
            .cpu_arch = .wasm32,
            .cpu_model = .{ .explicit = &std.Target.wasm.cpu.mvp },
            .cpu_features_add = std.Target.wasm.featureSet(&.{
                .atomics,
                .bulk_memory,
            }),
            .os_tag = .emscripten,
        });

        const tolan_lib = b.dependency("tolan", .{
            .target = wasm_target,
            .optimize = optimize,
        });
        const tolan_mod = tolan_lib.module("tolan-wasm");

        const wren_lib = tolan_lib.artifact("wren");
        const raylib_lib = tolan_lib.artifact("raylib");

        const emsdk_dep = b.dependency("emsdk", .{});
        const emsdk_include = emsdk_dep.path("upstream/emscripten/cache/sysroot/include");

        const app_lib = b.addLibrary(.{
            .linkage = .static,
            .name = "camera",
            .root_module = b.createModule(.{
                .root_source_file = b.path("abc.zig"),
                .target = wasm_target,
                .optimize = optimize,
                .imports = &.{
                    .{ .name = "tolan", .module = tolan_mod },
                },
            }),
        });
        app_lib.linkLibC();
        app_lib.shared_memory = true;
        app_lib.linkLibrary(wren_lib);
        app_lib.linkLibrary(raylib_lib);
        app_lib.addIncludePath(emsdk_include);

        try addAssetsOption(b, app_lib, target, optimize, b.getInstallStep());

        const emcc_path = std.fs.path.join(b.allocator, &.{
            emsdk_dep.path("").getPath(b),
            "upstream",
            "emscripten",
            switch (builtin.target.os.tag) {
                .windows => "emcc.bat",
                else => "emcc",
            },
        }) catch unreachable;
        const emcc = b.addSystemCommand(&.{emcc_path});
        // Use emsdk's own cache, not a nix-provided one (avoids version mismatch)
        const emsdk_cache = std.fs.path.join(b.allocator, &.{
            emsdk_dep.path("").getPath(b),
            "upstream",
            "emscripten",
            "cache",
        }) catch unreachable;
        emcc.setEnvironmentVariable("EM_CACHE", emsdk_cache);

        for (app_lib.getCompileDependencies(false)) |lib| {
            if (lib.isStaticLibrary()) {
                emcc.addArtifactArg(lib);
            }
        }

        for (wren_lib.getCompileDependencies(false)) |lib| {
            if (lib.isStaticLibrary()) {
                emcc.addArtifactArg(lib);
            }
        }

        for (raylib_lib.getCompileDependencies(false)) |lib| {
            if (lib.isStaticLibrary()) {
                emcc.addArtifactArg(lib);
            }
        }

        emcc.addArgs(&.{
            "-sUSE_GLFW=3",

            //"-sAUDIO_WORKLET=1",
            //"-sWASM_WORKERS=1",
            "-sSHARED_MEMORY=1",
            "-sALLOW_MEMORY_GROWTH=1",

            "-sASYNCIFY",
            "-sundefs",
            "-sEXPORTED_FUNCTIONS=['_main', '_run', '_stop_game']",
            "-sEXPORTED_RUNTIME_METHODS=['cwrap', 'ccall']",
            "-sERROR_ON_UNDEFINED_SYMBOLS=0",
            //"--shell-file",
            //b.path("shell.html").getPath(b),
        });

        const link_items: []const *std.Build.Step.Compile = &.{
            wren_lib,
            raylib_lib,
            app_lib,
        };

        for (link_items) |item| {
            emcc.addFileArg(item.getEmittedBin());
            emcc.step.dependOn(&item.step);
        }

        //emcc.addArg("--pre-js");
        emcc.addArg("-o");

        const app_html = emcc.addOutputFileArg("shell.html");

        b.getInstallStep().dependOn(&b.addInstallFile(b.path("index.html"), "www/index.html").step);
        b.getInstallStep().dependOn(&b.addInstallDirectory(.{
            .source_dir = b.path("samples"),
            .install_dir = .{ .custom = "www" },
            .install_subdir = "samples",
        }).step);

        b.getInstallStep().dependOn(&b.addInstallDirectory(.{
            .source_dir = app_html.dirname(),
            .install_dir = .{ .custom = "www" },
            .install_subdir = "",
        }).step);
    } else {
        const failed = b.addFail("Non wasm target chosen");
        _ = failed;
    }
}

// varied version of https://github.com/ringtailsoftware/zig-embeddir/blob/main/build.zig to include wren files
pub fn addAssetsOption(b: *std.Build, exe: anytype, target: anytype, optimize: anytype, step: *std.Build.Step) !void {
    var options = b.addOptions();

    var files: std.ArrayList([]const u8) = .empty;
    defer files.deinit(b.allocator);

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

                    try files.append(b.allocator, b.dupe(rel));
                }
            },
            .directory => {
                try checkWrenFiles(allocator, files, b, base_path, rel_to_base, step);
            },
            else => {},
        }
    }
}
