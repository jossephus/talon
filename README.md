<h1 align="center">Talon</h1>
<h3 align="center"><em>Write Raylib programs in Wren</em></h3>
<p align="center"></p>

## Talon

**Talon** is a (wannabe) 2D Game framwork that uses [Raylib](https://www.raylib.com/) as its rendering engine and [Wren](https://wren.io) as its scripting language. I recently started playing with Raylib to build a couple of toy games and I was really impressed with it. Wren is also one of my favorite lightweight languages. This project is a love letter to both of these projects.

## Status

The goal of this project is to eventually become stable enough to satisfy my needs in creating any 2D games. The inspiration for this was [love2d](love2d) and my plan is to make Talon a good alternative to love2d. At this time, it only implements basic Raylib functionalities, but in the future We will add Audio, Physics, Full Math, ... supports.

### Features

- [Raylib Functions](#raylib-functions)
- [Hot Reload on File Change](#hot-reload-on-file-change)
- [Build Executable files for Linux/Windows](#build-executable-files-for-linuxwindows)
- [Build Wasm using emscripten for ur talon games](#build-html-files)
- [Use dynamic libraries (.so, .dll) to add functionalities](#use-dynamic-libraries-sodll-to-to-add-functionalities)
- [Playground](#playground)
- ... and many others

## Demo

Wren is a very simple language. You can master it in less than 30 mins by just skimming the documentation on its [official website](wren.io).

Here is how you create a very basic window using Talon.

```wren
import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D

var width = 800
var height = 450
var title = "Sample"

Raylib.initWindow(width, height, title)
Raylib.setTargetFPS(60)

var camera = Camera2D.new(
   Vector2.new(2.0, 0.0),
   Vector2.new(0.0, 0.0),
   0.0,
   1.0
)

var target = Raylib.loadRenderTexture(width, height)

while (!Raylib.windowShouldClose()) {
  Raylib.beginDrawing()

  Raylib.clearBackground(Color.Red)

  Raylib.drawText("Congrats! You created your first window!", 190, 200, 20, Color.Green)

  Raylib.getScreenWidth()
  Raylib.getScreenHeight()

  if (Raylib.isKeyDown(KeyCode.KEY_SPACE)) {
      System.print("Space is Pressed")
  }

  Raylib.drawTexturePro(target.texture,
    Rectangle.new(0.0, 0.0, target.texture.width, target.texture.height),
    Rectangle.new(0.0, 0.0, target.texture.width, target.texture.height),
    Vector2.new(0.0, 0.0),
    0.0,
    Color.new(255, 255, 255, 255 )
  )

  Raylib.endDrawing()
}

Raylib.clearBackground(Color.Gray)
Raylib.unloadRenderTexture(target)
Raylib.closeWindow()
```

## Getting Started

We provide releases for linux/windows (other platforms coming soon). You can download from releases and try it out. You can save the above demo program in index.wren file and you can use

```sh
$ talon index.wren
```

to run it. You should see a simple window at this point.

## Features

#### Raylib Functions

Almost all Raylib functions are exposed to users of talon. We change each function of to be exposed from the Raylib class and uses Snake Case for Talon instead. For example for the raylib function 'InitWindow' it would be 'Raylib.initWindow' in Talon.

Raylib structs like Camera2D, Vector2 and ... are exposed as class in Talon with the same name. You can checkout the examples to see how to utilize them.

#### Hot Reload on File Change

running talon with --hot option runs it in full file watcher mode and reloads when there is any change in ur wren files.

```sh
talon --hot index.wren

```

TODO: At its current status we are rerunning the whole program but it will need some work so we can reload the parts that get changed.

#### Build Executable files for Linux/Windows

We use docker to provide linux/windows builds for talon. When you are ready to distribute your game for windows/linux users you can run

```sh
$ talon init-exe index.wren
```

Two files with name Dockerfile and docker-compose.yml will be created for you and then You can use 'docker compose up --build -d' which will create windows/linux builds in ur current dist/ folder.

#### Build HTML files

We use emscripten to give u a working implementation of ur raylib games. This also depends on docker and you can run

```sh
$ talon init-wasm index.wren
$ docker compose up --build -d
```

You can then see ur wasm builds in dist/ folder

#### Use dynamic libraries (.so, .dll) to to add functionalities

Check examples/extend to see how this works. TODO:// add details

#### Playground

Checkout [Playground](jossephus.github.io/talon/)
