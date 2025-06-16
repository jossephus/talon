FROM nixos/nix

ARG VERSION=0.14.0

RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

WORKDIR /build
COPY . /build


RUN cat <<'EOF' > flake.nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zig.url = "github:mitchellh/zig-overlay";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    zig,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        overlays = [
          (final: prev: {
            zigpkgs = zig.packages.${system};
          })
        ];
        pkgs = import nixpkgs {
          inherit overlays system;
        };
        packages = with pkgs; [
          glfw
          libGL
          libxkbcommon
          python3
          pkg-config
          xorg.libxcb
          xorg.libXft
          xorg.libX11
          xorg.libX11.dev
          xorg.libXrandr
          xorg.libXinerama
          xorg.libXcursor
          xorg.libXi
          glfw-wayland
          zigpkgs."0.14.0"
          emscripten
        ];
      in {
        devShell = pkgs.mkShell {
          buildInputs = packages;
          nativeBuildInputs = with pkgs; [cmake pkg-config ncurses fontconfig freetype];
          shellHook = ''
            export SHELL=/usr/bin/bash
            if [ ! -d $(pwd)/.emscripten_cache-${pkgs.emscripten.version} ]; then
              cp -R ${pkgs.emscripten}/share/emscripten/cache/ $(pwd)/.emscripten_cache-${pkgs.emscripten.version}
              chmod u+rwX -R $(pwd)/.emscripten_cache-${pkgs.emscripten.version}
            fi
            export EM_CACHE=$(pwd)/.emscripten_cache-${pkgs.emscripten.version}
            echo emscripten cache dir: $EM_CACHE
          '';
        };
      }
    );
}

EOF

RUN cat <<'EOF' > build.zig.zon 
.{
    .name = .build_exe,

    .version = "0.0.0",

    .fingerprint = 0x7aca45f40a314ba8, // Changing this has security and trust implications.

    .minimum_zig_version = "0.14.0",

    .dependencies = .{
      .tolan = .{
          .url = "git+https://github.com/jossephus/talon#ec9dc6910fa96c414406b5ed539e441943e4aadd",
          .hash = "zig_wren-0.0.0-_Mx4iLclCACui2mzMF9z9j7iRplB0vS_jZjf-k9EQNLC",
      },
      .wren = .{
          .url = "https://github.com/wren-lang/wren/archive/refs/heads/main.zip",
          .hash = "N-V-__8AAPbpYgAZgdr-sM49A18GSKr5MVR56MwpfI65FmAZ",
      },
      .raylib = .{
          .url = "git+https://github.com/raysan5/raylib#27a4fe885164b315a90b67682f981a1e03d6079c",
          .hash = "raylib-5.5.0-whq8uFqtNARw6t1tTakBDSVYgUjlBqnDppOyNfE_yfCa",
      },
    },

    .paths = .{
        "build.zig",
        "build.zig.zon",
        "src",
    },
}

EOF

RUN cat <<'EOF' > build.zig
const std = @import("std");

const mainFile = "main.wren";

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
        const tolan_mod = tolan_lib.module("tolan");

        const wren_lib = tolan_lib.artifact("wren");
        const raylib_lib = tolan_lib.artifact("raylib");

        const app_lib = b.addLibrary(.{
            .linkage = .static,
            .name = "camera",
            .root_module = b.createModule(.{
                .root_source_file = b.path("build.zig"),
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
        app_lib.addIncludePath(.{ .cwd_relative = ".emscripten_cache-4.0.8/sysroot/include" });

        try addAssetsOption(b, app_lib, target, optimize, b.getInstallStep());

        const emcc = b.addSystemCommand(&.{"emcc"});

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
            "-sUSE_OFFSET_CONVERTER",

            //"-sAUDIO_WORKLET=1",
            //"-sWASM_WORKERS=1",
            "-sSHARED_MEMORY=1",
            "-sALLOW_MEMORY_GROWTH=1",

            "-sASYNCIFY",
            "-sundefs",
            "-sERROR_ON_UNDEFINED_SYMBOLS=0",
            "--shell-file",
            b.path("shell.html").getPath(b),
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

        const app_html = emcc.addOutputFileArg("index.html");
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

export fn add(a: i32, b: i32) i32 {
    return a + b;
}

export fn sub(a: i32, b: i32) i32 {
    return a - b;
}

const tolan = @import("tolan");

EOF


RUN nix develop -L --verbose

# RUN /compiler/zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-windows
#RUN /compiler/zig build -Dtarget=x86_64-windows
