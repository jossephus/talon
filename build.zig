const std = @import("std");

fn addAssets(b: *std.Build, exe: *std.Build.Step.Compile) void {
    const assets = [_][]const u8{};

    for (assets) |asset| {
        exe.root_module.addAnonymousImport(asset, .{ .root_source_file = b.path(asset) });
    }
}

pub fn build(b: *std.Build) void {
    const upstream = b.dependency("wren", .{});
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

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

    b.installArtifact(wren_lib);

    //const exe_mod = b.createModule(.{
    //.target = target,
    //.optimize = optimize,
    //});

    //exe_mod.linkLibrary(wren_lib);

    const exe = b.addExecutable(.{
        .name = "littlesun",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    exe.linkLibrary(wren_lib);

    const raylib_dep = b.dependency("raylib", .{
        .target = target,
        .optimize = optimize,
        .linux_display_backend = .X11,
    });
    const raylib_lib = raylib_dep.artifact("raylib");
    exe.linkLibrary(raylib_lib);

    //const install_step = b.addInstallDirectory(.{
    //.source_dir = b.path("res"),
    //.install_dir = std.Build.InstallDir{ .custom = "res" },
    //.install_subdir = "res",
    //});
    //exe.step.dependOn(&install_step.step);
    //addAssets(b, exe);

    //const exe = b.addExecutable(.{
    //.name = "example",
    //.root_module = exe_mod,
    //});
    //exe.addCSourceFiles(.{
    //.root = b.path("src/"),
    //.files = &.{"main.c"},
    //});

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const run_abc_step = b.step("example", "Run the executable with abc.txt");

    const run_abc = b.addRunArtifact(exe);
    run_abc.setCwd(b.path("examples/breakout"));
    run_abc.addArg("./main.wren");

    run_abc_step.dependOn(&run_abc.step);
}
