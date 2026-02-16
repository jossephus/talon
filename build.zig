const std = @import("std");
const builtin = @import("builtin");

fn addAssets(b: *std.Build, exe: *std.Build.Step.Compile) void {
    const assets = [_][]const u8{};

    for (assets) |asset| {
        exe.root_module.addAnonymousImport(asset, .{ .root_source_file = b.path(asset) });
    }
}

fn addWrenDep(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, emsdk_include: ?std.Build.LazyPath) *std.Build.Step.Compile {
    const upstream = b.dependency("wren", .{});

    const wren_lib = b.addLibrary(.{
        .name = "wren",
        .linkage = .static,
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });
    wren_lib.addIncludePath(upstream.path("src/include"));
    wren_lib.addIncludePath(upstream.path("src/vm"));
    wren_lib.addIncludePath(upstream.path("src/optional"));

    wren_lib.addCSourceFiles(.{ .root = upstream.path("src/vm"), .files = &.{
        "wren_compiler.c",
        "wren_core.c",
        "wren_debug.c",
        "wren_primitive.c",
        "wren_utils.c",
        "wren_value.c",
        "wren_vm.c",
    } });

    wren_lib.addCSourceFiles(.{ .root = upstream.path("src/optional"), .files = &.{
        "wren_opt_meta.c",
        "wren_opt_random.c",
    } });

    wren_lib.installHeadersDirectory(upstream.path("src/include"), "", .{
        .include_extensions = &.{
            "wren.h",
        },
    });

    if (emsdk_include) |inc| wren_lib.addIncludePath(inc);

    b.installArtifact(wren_lib);
    return wren_lib;
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const emsdk_include: ?std.Build.LazyPath = if (target.result.cpu.arch.isWasm())
        b.dependency("emsdk", .{}).path("upstream/emscripten/cache/sysroot/include")
    else
        null;

    const wren_lib = addWrenDep(b, target, optimize, emsdk_include);

    // Activate emsdk so the sysroot is populated before compiling C sources
    if (target.result.cpu.arch.isWasm()) {
        const emsdk_path = b.dependency("emsdk", .{}).path("").getPath(b);
        const emsdk_script = std.fs.path.join(b.allocator, &.{
            emsdk_path,
            switch (builtin.target.os.tag) {
                .windows => "emsdk.bat",
                else => "emsdk",
            },
        }) catch unreachable;

        const emsdk_install = b.addSystemCommand(&.{ emsdk_script, "install", "4.0.3" });
        switch (builtin.target.os.tag) {
            .linux, .macos => {
                emsdk_install.step.dependOn(&b.addSystemCommand(&.{ "chmod", "+x", emsdk_script }).step);
            },
            else => {},
        }

        const emsdk_activate = b.addSystemCommand(&.{ emsdk_script, "activate", "4.0.3" });
        emsdk_activate.step.dependOn(&emsdk_install.step);

        wren_lib.step.dependOn(&emsdk_activate.step);
    }

    const raylib_dep = if (target.result.cpu.arch.isWasm()) b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
        .rmodels = false,
    }) else b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
        .linux_display_backend = .X11,
    });

    const raylib_lib = raylib_dep.artifact("raylib");

    const exe = b.addExecutable(.{
        .name = "talon",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

    exe.linkLibrary(wren_lib);
    exe.linkLibrary(raylib_lib);

    const lib = b.addModule("tolan", .{
        .root_source_file = b.path("src/root.zig"),
    });

    lib.linkLibrary(wren_lib);
    lib.linkLibrary(raylib_lib);
    if (emsdk_include) |inc| lib.addIncludePath(inc);

    const libWasm = b.addModule("tolan-wasm", .{
        .root_source_file = b.path("src/root-wasm.zig"),
    });

    libWasm.linkLibrary(wren_lib);
    libWasm.linkLibrary(raylib_lib);
    if (emsdk_include) |inc| libWasm.addIncludePath(inc);

    const c_exe_mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
    });
    const c_exe = b.addExecutable(.{
        .name = "sample_c",
        .root_module = c_exe_mod,
    });
    c_exe.addCSourceFiles(.{
        .root = b.path("src/"),
        .files = &.{"main.c"},
    });
    c_exe.linkLibrary(wren_lib);
    c_exe.linkLibrary(raylib_lib);
    const c_sample_step = b.step("sample", "Generate raylib bindings");
    const sample_run = b.addRunArtifact(c_exe);
    c_sample_step.dependOn(&sample_run.step);

    b.installArtifact(exe);
    b.installArtifact(raylib_lib);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const run_abc_step = b.step("breakout", "Run the executable with abc.txt");

    const run_abc = b.addRunArtifact(exe);
    run_abc.setCwd(b.path("examples/breakout"));
    run_abc.addArg("./main.wren");

    run_abc_step.dependOn(&run_abc.step);

    const generator = b.addExecutable(.{
        .name = "generator",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/bindings/generate/generate.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

    const generator_step = b.step("generator", "Generate raylib bindings from raylib_api.json");

    const generator_run = b.addRunArtifact(generator);

    generator_step.dependOn(&generator_run.step);
}
