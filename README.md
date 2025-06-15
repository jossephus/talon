<h1 align="center">Talon</h1>
<h3 align="center"><em>Write Raylib programs in Wren</em></h3>
<p align="center"></p>

## Talon

**Talon** is a (wannabe) 2D Game framwork that uses [Raylib](https://www.raylib.com/) as its rendering engine and [Wren](https://wren.io) as its scripting language. I recently started playing with Raylib to build a couple of toy games and I was really impressed with it. Wren is also one of my favorite lightweight languages that i use occasionally. This project is my attempt to deep dive into Raylib apis and to make use of wren as an embedded scripting language.

## Status

The goal of this project is to eventually become stable enough to satisfy my needs in creating any 2D games. The inspiration for this was [love2d](love2d) and my plan is to make Talon a good alternative to love2d. At this time, it only implements basic Raylib functionalities, but in the future We will add Audio, Physics, Full Math, ... supports.

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

The only way to try out Talon at this time is to clone the repo and build it yourself. Make sure you have zig 0.14.0 installed.

```sh
git clone https://github.com/jossephus/talon
cd talon
zig build run -- ./examples/src/main.wren
```

You can also run the breakout example by running. (It will almost work :-))

```
zig build breakout
```
