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
          .path = "../../"
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


RUN cat <<'EOF' > shell.html
<!doctype html>
<html lang="EN-us">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Breakout Sample Game</title>

    <meta name="title" content="raylib web game" />
    <meta name="viewport" content="width=device-width" />

    <!-- Open Graph metatags for sharing -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="raylib web game" />
    <meta property="og:image:type" content="image/png" />
    <meta
      property="og:image"
      content="https://www.raylib.com/common/raylib_logo.png"
    />

    <!-- Twitter metatags for sharing -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:site" content="@raysan5" />
    <meta name="twitter:title" content="raylib web game" />
    <meta
      name="twitter:image"
      content="https://www.raylib.com/common/raylib_logo.png"
    />
    <meta name="twitter:url" content="https://www.raylib.com/games.html" />

    <style>
      body {
        font-family: arial;
        margin: 0;
        padding: none;
      }

      #header {
        width: 100%;
        height: 80px;
        background-color: #888888;
      }

      /* NOTE: raylib logo is embedded in the page as base64 png image */
      #logo {
        width: 64px;
        height: 64px;
        float: left;
        position: relative;
        margin: 10px;
        background-image: url("data:image/png;base64,\
iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAIAAAAlC+aJAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADs\
MAAA7DAcdvqGQAAAAadEVYdFNvZnR3YXJlAFBhaW50Lk5FVCB2My41LjExR/NCNwAAA7JJREFUaEPtk0FyWzEMQ+37X7fZhxX4\
YY3AD1OKF1nkzTRlSBCCLeVBnvl/AUdaELOunPno1kts1kixdtEZKVs+xIxebBkZsVknn/L5nFGDLR8T4zVC9fX19S/+tTFijr\
YK4jUjbPUtqBHpnEE6PkZD7jQZV8n5Recw1XQKciZuPaEtR6UjNs5ENVGMsBVqpPtER0ZMOhpyp8m4YL4OjD9yxsyZxnQycfMJ\
ETNSzsRE1+dihK3YMiJmpHTW3xpmXPC6BXlCHfqnBlsjY5hxf/6EVEOM2BTEi0fYCX4ONSI6Kq3Blg/prIOMq2CsRur4KQ0x64\
SdjOufEDEdHZGOhmz5RDHCVqhRuQ86YsVskbc+GXchLiHnFyYH+UigQDVGnImbT8hwFkgLg2qiM8JO6Ylx1FNLa3DmYwqCTsZd\
4BPqGJG7MwKzpeiWKTKxXkLMVE3MSOmsdwxLH6Rd/wCCLSNDx6djeKfJuArGeoYamRHpaEjnCBYZVy8hZqo2GI36qPjsiOiMsB\
XGcev4Mx9TLGTchbgEjN/uz6jGrBvDjg+LTNx8Qp2CbG2xMKgmOiPslJ4Yxx+eSnSkzlosZNwFPiHl7FRTkLNRJm4+IeVM0ymI\
H42wE/wcKalQI4MRl4EW3p6VcRWMua8F6WjIlqZDxvVPiHQ6CjVbYkV9ohhhp/Rk1wiYgpyJ78i4CsZbjkb8Qx+ihvzu3RPaKo\
gZkY6GlEeMsKdPSOFIC8VoOusg44L5c+T8ouOoGhWbdWJ8tMi4egkxo4hoh2yNTGf3iIyr5Lyic4bRENXo+lvDjAt4C1Hk/OKt\
UaAj0+n4dMSZ2D+hrYJsaYh2SClG2jV9kJKKzhlGQ1SsW299Mq6C8dYZHTExo8fzieI5ivipYnYy7nwJqGKmOYyRwfiUBXITfh\
5qSHRGWEkfqJqURgvsdHyWYv7Ko8DnYYegk3EB00cxprdrJRzFd7YQzawu8L1GMTYS/KpPaAFTkIn1EmJmspJSs5xBzSyGhlkB\
mlxfNFiP5mw4wlbMh4F5Ddxp5jNINBdCEz9zPOC1zD7Q0HBdmXndwv0TMtydEdzlWJT4VZ8Qt9Qn4/onxMIwa5ZYGJU5yufBiC\
jwE50AGjLCVuS8Yt4H7OgZLKK5EKOsLviEWJSL/+0uMi7gLUSBseYwqEbXvSHCec1CJvZPyHCmYQffaBBfOTCGHM2aEbZi1+gO\
1XTWVXMnzrhAn5DSOZVsiQlHnSITKzGj6DeTcZWc/3oy7h9//PF4PL4BlvsWrb6RE+oAAAAASUVORK5CYII=");
      }

      .emscripten {
        padding-right: 0;
        margin-left: auto;
        margin-right: auto;
        display: block;
      }
      div.emscripten {
        text-align: center;
      }
      div.emscripten_border {
        border: 1px solid black;
      }

      /* NOTE: Canvas *must not* have any border or padding, or mouse coords will be wrong */
      canvas.emscripten {
        border: 0px none;
        background: black;
        width: 100%;
      }

      .spinner {
        height: 30px;
        width: 30px;
        margin: 0;
        margin-top: 20px;
        margin-left: 20px;
        display: inline-block;
        vertical-align: top;
        -webkit-animation: rotation 0.8s linear infinite;
        -moz-animation: rotation 0.8s linear infinite;
        -o-animation: rotation 0.8s linear infinite;
        animation: rotation 0.8s linear infinite;
        border-left: 5px solid black;
        border-right: 5px solid black;
        border-bottom: 5px solid black;
        border-top: 5px solid red;
        border-radius: 100%;
        background-color: rgb(245, 245, 245);
      }
      @-webkit-keyframes rotation {
        from {
          -webkit-transform: rotate(0deg);
        }
        to {
          -webkit-transform: rotate(360deg);
        }
      }
      @-moz-keyframes rotation {
        from {
          -moz-transform: rotate(0deg);
        }
        to {
          -moz-transform: rotate(360deg);
        }
      }
      @-o-keyframes rotation {
        from {
          -o-transform: rotate(0deg);
        }
        to {
          -o-transform: rotate(360deg);
        }
      }
      @keyframes rotation {
        from {
          transform: rotate(0deg);
        }
        to {
          transform: rotate(360deg);
        }
      }

      #status {
        display: inline-block;
        vertical-align: top;
        margin-top: 30px;
        margin-left: 20px;
        font-weight: bold;
        color: rgb(40, 40, 40);
      }

      #progress {
        height: 0px;
        width: 0px;
      }

      #controls {
        display: inline-block;
        float: right;
        vertical-align: top;
        margin-top: 15px;
        margin-right: 20px;
      }

      #output {
        border-left: 0px none;
        border-right: 0px none;
        border-bottom: 0px none;
        padding-left: 0;
        padding-right: 0;
        width: 100%;
        height: 140px;
        margin: 0 auto;
        margin-top: 10px;
        display: block;
        background-color: black;
        color: rgb(37, 174, 38);
        font-family: "Lucida Console", Monaco, monospace;
        outline: none;
      }

      input[type="button"] {
        background-color: lightgray;
        border: 4px solid darkgray;
        color: black;
        text-decoration: none;
        cursor: pointer;
        width: 140px;
        height: 50px;
        margin-left: 10px;
      }

      input[type="button"]:hover {
        background-color: #f5f5f5ff;
        border-color: black;
      }
    </style>
  </head>
  <body>
    <div id="header">
      <a id="logo" href="https://www.raylib.com"></a>

      <div class="spinner" id="spinner"></div>
      <div class="emscripten" id="status">Downloading...</div>

      <span id="controls">
        <span
          ><input
            type="button"
            value="📜 SOURCE CODE"
            onclick="location.href='https://github.com/raysan5/raylib';"
        /></span>
        <span
          ><input
            type="button"
            value="🖵 FULLSCREEN"
            onclick="Module.requestFullscreen(false, false)"
        /></span>
        <span
          ><input
            type="button"
            id="btn-audio"
            value="🔇 MUTE"
            onclick="toggleAudio()"
        /></span>
      </span>

      <div class="emscripten">
        <progress value="0" max="100" id="progress" hidden="1"></progress>
      </div>
    </div>

    <div class="emscripten_border">
      <canvas
        class="emscripten"
        id="canvas"
        oncontextmenu="event.preventDefault()"
        tabindex="-1"
      ></canvas>
    </div>

    <textarea id="output" rows="8"></textarea>
    <button
      onclick="alert(Module.cwrap('add', 'number', ['number', 'number'])(2, 3))"
    >
      Call Zig add(2, 3)
    </button>

    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/gh/eligrey/FileSaver.js/dist/FileSaver.min.js"
    ></script>
    <script type="text/javascript">
      function saveFileFromMEMFSToDisk(memoryFSname, localFSname) {
        // This can be called by C/C++ code
        var isSafari = false; // Not supported, navigator.userAgent access is being restricted
        //var isSafari = /^((?!chrome|android).)*safari/i.test(navigator.userAgent);
        var data = FS.readFile(memoryFSname);
        var blob;

        if (isSafari)
          blob = new Blob([data.buffer], { type: "application/octet-stream" });
        else
          blob = new Blob([data.buffer], { type: "application/octet-binary" });

        // NOTE: SaveAsDialog is a browser setting. For example, in Google Chrome,
        // in Settings/Advanced/Downloads section you have a setting:
        // 'Ask where to save each file before downloading' - which you can set true/false.
        // If you enable this setting it would always ask you and bring the SaveAsDialog
        saveAs(blob, localFSname);
      }
    </script>
    <script type="text/javascript">
      var statusElement = document.querySelector("#status");
      var progressElement = document.querySelector("#progress");
      var spinnerElement = document.querySelector("#spinner");
      var Module = {
        preRun: [],
        postRun: [],
        print: (function () {
          var element = document.querySelector("#output");

          if (element) element.value = ""; // Clear browser cache

          return function (text) {
            if (arguments.length > 1)
              text = Array.prototype.slice.call(arguments).join(" ");
            // These replacements are necessary if you render to raw HTML
            //text = text.replace(/&/g, "&amp;");
            //text = text.replace(/</g, "&lt;");
            //text = text.replace(/>/g, "&gt;");
            //text = text.replace('\n', '<br>', 'g');
            console.log(text);

            if (element) {
              element.value += text + "\n";
              element.scrollTop = element.scrollHeight; // focus on bottom
            }
          };
        })(),
        printErr: function (text) {
          if (arguments.length > 1)
            text = Array.prototype.slice.call(arguments).join(" ");

          console.error(text);
        },
        canvas: (function () {
          var canvas = document.querySelector("#canvas");

          // As a default initial behavior, pop up an alert when webgl context is lost.
          // To make your application robust, you may want to override this behavior before shipping!
          // See http://www.khronos.org/registry/webgl/specs/latest/1.0/#5.15.2
          canvas.addEventListener(
            "webglcontextlost",
            function (e) {
              alert("WebGL context lost. You will need to reload the page.");
              e.preventDefault();
            },
            false,
          );
          canvas.addEventListener(
            "keydown",
            (e) => {
              if (
                [
                  "Space",
                  "ArrowUp",
                  "ArrowDown",
                  "ArrowLeft",
                  "ArrowRight",
                  "F1",
                  "F3",
                  "F5",
                ].indexOf(e.code) > -1
              ) {
                e.preventDefault();
              }
            },
            false,
          );
          canvas.scrollIntoView({ behavior: "smooth" });
          canvas.focus();

          return canvas;
        })(),
        setStatus: function (text) {
          if (!Module.setStatus.last)
            Module.setStatus.last = { time: Date.now(), text: "" };
          if (text === Module.setStatus.last.text) return;

          var m = text.match(/([^(]+)\((\d+(\.\d+)?)\/(\d+)\)/);
          var now = Date.now();

          if (m && now - Module.setStatus.last.time < 30) return; // If this is a progress update, skip it if too soon

          Module.setStatus.last.time = now;
          Module.setStatus.last.text = text;

          if (m) {
            text = m[1];
            progressElement.value = parseInt(m[2]) * 100;
            progressElement.max = parseInt(m[4]) * 100;
            progressElement.hidden = true;
            spinnerElement.hidden = false;
          } else {
            progressElement.value = null;
            progressElement.max = null;
            progressElement.hidden = true;
            if (!text) spinnerElement.style.display = "none";
          }

          statusElement.innerHTML = text;
        },
        totalDependencies: 0,
        monitorRunDependencies: function (left) {
          this.totalDependencies = Math.max(this.totalDependencies, left);
          Module.setStatus(
            left
              ? "Preparing... (" +
                  (this.totalDependencies - left) +
                  "/" +
                  this.totalDependencies +
                  ")"
              : "All downloads complete.",
          );
        },
        //noInitialRun: true
      };

      Module.setStatus("Downloading...");

      window.onerror = function () {
        Module.setStatus("Exception thrown, see JavaScript console");
        spinnerElement.style.display = "none";
        Module.setStatus = function (text) {
          if (text) Module.printErr("[post-exception status] " + text);
        };
      };
    </script>

    <!-- REF: https://developers.google.com/web/updates/2018/11/web-audio-autoplay -->
    <script type="text/javascript">
      var audioBtn = document.querySelector("#btn-audio");

      // An array of all contexts to resume on the page
      const audioContexList = [];
      (function () {
        // A proxy object to intercept AudioContexts and
        // add them to the array for tracking and resuming later
        self.AudioContext = new Proxy(self.AudioContext, {
          construct(target, args) {
            const result = new target(...args);
            audioContexList.push(result);
            if (result.state == "suspended") audioBtn.value = "🔈 RESUME";
            return result;
          },
        });
      })();

      function toggleAudio() {
        var resumed = false;
        audioContexList.forEach((ctx) => {
          if (ctx.state == "suspended") {
            ctx.resume();
            resumed = true;
          } else if (ctx.state == "running") ctx.suspend();
        });

        if (resumed) audioBtn.value = "🔇 MUTE";
        else audioBtn.value = "🔈 RESUME";
      }
      Module.onRuntimeInitialized = function () {
        <!--// cwrap(functionName, returnType, [argTypes])-->
        <!--const add = Module.cwrap("add", "number", ["number", "number"]);-->
        <!--const result = add(10, 5);-->
        <!--console.log("10 + 5 = " + result);-->
      };
    </script>
    {{{ SCRIPT }}}
  </body>
</html>
EOF

RUN nix develop -L --verbose

# RUN /compiler/zig build -Doptimize=ReleaseSafe -Dtarget=x86_64-windows
#RUN /compiler/zig build -Dtarget=x86_64-windows
