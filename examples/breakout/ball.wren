import "raylib" for Raylib, Rectangle, Vector2, Color
import "./paddle" for PADDLE_H
import "./utils" for SCREEN_HEIGHT, SCREEN_WIDTH

var BALL_W = 16.0
var BALL_H = 16.0
var BALL_SPEED = 300.0


var BALL_TEXTURE_DIMS = Rectangle.new(0.0, 0.0, 16.0, 16.0)

class Ball {
  construct new() {
        _rec = Rectangle.new(
            SCREEN_WIDTH / 2.0 - BALL_W / 2.0,
            SCREEN_HEIGHT - BALL_H - PADDLE_H - 40.0,
            BALL_W,
            BALL_H
        )
        _vel = Vector2.new(
            BALL_SPEED, 
            -BALL_SPEED
        )
    }

    rec { _rec }

    vel { _vel }
   
    draw(texture) {
      Raylib.drawTexturePro(
           texture, 
           BALL_TEXTURE_DIMS, 
           _rec, 
           Vector2.new(0.0, 0.0),
           0.0, 
           Color.new(255, 255, 255, 255)
        )
    }

    apply_collission(rec) {
       var prev_x = _rec.x - _vel.x
       var prev_y = _rec.y - _vel.y

        if (prev_y + _rec.height <= _rec.y) {
            _vel.y = _vel.y * -1.0
        } else if (prev_y >= _rec.y + _rec.height) {
            _vel.y = _vel.y * -1.0
        } else if (prev_x + _rec.width <= _rec.x) {
            _vel.x = _vel.x * -1.0
        } else if (prev_x >= _rec.x + _rec.width) {
            _vel.x = _vel.x * -1.0
        } else {
            _vel.y = _vel.y * -1.0
        }
    }
}

