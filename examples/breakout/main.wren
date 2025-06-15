import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D
import "math" for Math
import "./game" for Game

var width = 600
var height = 800
var title = "Sample"

Raylib.initWindow(width, height, title)

var min = Fn.new { |a, b| 
  if (a < b) return a
  return b
}

var game = Game.new()

Raylib.setTargetFPS(60)

var target = Raylib.loadRenderTexture(width, height)
System.print(target)


while (!Raylib.windowShouldClose()) {
  game.update()

  var width_scale = Raylib.getScreenWidth() / width
  var height_scale = Raylib.getScreenHeight() / height
  var scale = min.call(width_scale, height_scale)

  Raylib.beginTextureMode(target)
  game.draw()
  Raylib.endTextureMode(target)


  Raylib.beginDrawing()
  Raylib.clearBackground(Color.new(20, 20, 20, 255))

  Raylib.drawTexturePro(
            target.texture,
            Rectangle.new(
                0.0,
                0.0,
                target.texture.width,
                target.texture.height),
            Rectangle.new(
                0.0,
                0.0,
                target.texture.width,
                target.texture.height),
            Vector2.new(0.0, 0.0),
            0.0,
            Color.new(255, 255, 255, 255 )
        )

  Raylib.endDrawing()
}

Raylib.clearBackground(Color.Gray)
Raylib.unloadRenderTexture(target)
Raylib.closeWindow()

