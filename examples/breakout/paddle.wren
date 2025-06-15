import "raylib" for Raylib, Rectangle, Vector2, Color

var PADDLE_W = 128.0
var PADDLE_H = 16.0
var PADDLE_SPEED = 500.0

var PADDLE_TEXTURE_DIMS = Rectangle.new(0.0, 0.0, 64.0, 16.0)

var SCREEN_WIDTH = 600
var SCREEN_HEIGHT = 800

class Paddle {
  construct new() {
    _rec = Rectangle.new(
       SCREEN_WIDTH / 2.0 - PADDLE_W / 2.0,
       SCREEN_HEIGHT - PADDLE_H - 20.0, 
       PADDLE_W,
       PADDLE_H
     )
    }
  rec { _rec }

    draw(texture) {
      Raylib.drawTexturePro(
          texture, 
          PADDLE_TEXTURE_DIMS, 
          _rec, 
          Vector2.new(0.0, 0.0),
          0.0, 
          Color.new(255, 255, 255, 255)
      )
    }
}

