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
          libxcb
          libXft
          libX11
          libX11.dev
          libXrandr
          libXinerama
          libXcursor
          libXi
          zigpkgs."0.15.2"
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
