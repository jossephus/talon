const std = @import("std");

fn addAssets(b: *std.Build, exe: *std.Build.Step.Compile) void {
    const assets = [_][]const u8{};

    for (assets) |asset| {
        exe.root_module.addAnonymousImport(asset, .{ .root_source_file = b.path(asset) });
    }
}

fn addWrenDep(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.Mode) *std.Build.Step.Compile {
    const upstream = b.dependency("wren", .{});

    const wren_lib = b.addStaticLibrary(.{
        .name = "wren",
        .target = target,
        .optimize = optimize,
    });
    wren_lib.linkLibC();
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

    if (target.result.cpu.arch.isWasm()) wren_lib.addIncludePath(.{ .cwd_relative = ".emscripten_cache-4.0.8/sysroot/include" });

    b.installArtifact(wren_lib);
    return wren_lib;
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const wren_lib = addWrenDep(b, target, optimize);

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

    //exe_mod.linkLibrary(wren_lib);

    const exe = b.addExecutable(.{
        .name = "talon",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    exe.linkLibrary(wren_lib);
    exe.linkLibrary(raylib_lib);

    const lib = b.addModule("tolan", .{
        .root_source_file = b.path("src/root.zig"),
    });

    lib.linkLibrary(wren_lib);
    lib.linkLibrary(raylib_lib);
    if (target.result.cpu.arch.isWasm()) lib.addIncludePath(.{ .cwd_relative = ".emscripten_cache-4.0.8/sysroot/include" });

    const libWasm = b.addModule("tolan-wasm", .{
        .root_source_file = b.path("src/root-wasm.zig"),
    });

    libWasm.linkLibrary(wren_lib);
    libWasm.linkLibrary(raylib_lib);
    if (target.result.cpu.arch.isWasm()) libWasm.addIncludePath(.{ .cwd_relative = ".emscripten_cache-4.0.8/sysroot/include" });

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

    //const install_step = b.addInstallDirectory(.{
    //.source_dir = b.path("res"),
    //.install_dir = std.Build.InstallDir{ .custom = "res" },
    //.install_subdir = "res",
    //});
    //exe.step.dependOn(&install_step.step);
    //addAssets(b, exe);

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
        .root_source_file = b.path("src/bindings/generate/generate.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    const generator_step = b.step("generator", "Generate raylib bindings");

    const generator_run = b.addRunArtifact(generator);
    //generator_run.setCwd(b.path("examples/breakout"));
    //run_abc.addArg("./main.wren");

    generator_step.dependOn(&generator_run.step);
}
