const std = @import("std");

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
        .name = "example",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe.linkLibrary(wren_lib);

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
}
