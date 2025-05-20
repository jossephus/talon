import "raylib" for Raylib, Rectangle, Vector2, Color

var BRICK_W = 48.0 
var BRICK_H = 16.0

var BRICK_GAP = 22.0 
var BRICK_MARGIN = 32.0

var BRICK_TEXTURE_DIMS = Rectangle.new(0.0, 0.0, 48.0, 16.0)

class Brick {
    construct new(x, y) {
      _rec = Rectangle.new(x, y, BRICK_W, BRICK_H )
    }

    rec { _rec }

    draw(texture) {
      Raylib.drawTexturePro(
      texture,
      BRICK_TEXTURE_DIMS, 
      _rec, 
      Vector2.new(0.0, 0.0),
      0.0, 
      Color.new(255, 255, 255, 255)
      )
    }

    static new_bricks(rows, cols) {
      var list = []
    
      var i = 0

      while (i < rows) {
        var j = 0
        while (j < cols) {
            var bx = j * BRICK_W + j + 1.0 * BRICK_GAP + BRICK_MARGIN
            var by = i * BRICK_H + i + 1.0 * BRICK_GAP + BRICK_MARGIN
            list.add(Brick.new(bx, by))
            j = j + 1
        }
        i = i + 1
      }
      return list
    }
}


