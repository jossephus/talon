import "raylib" for Raylib, Rectangle, Vector2, Color

var SCORE_FONT_SIZE = 16
var SCORE_INC_Y = 0.0
var SCORE_PROG_INC_Y = 0.025

class ScoreIndicator {
  construct new(value, x, y) {
    _value = value
    _pos = Vector2.new(x, y)
    _progress = 0.0 
    _start_y = y
    _x = x
  }

  progress { _progress }
  progress=(value) { _progress = value }
  pos { _pos }
  start_y { _start_y }

  draw() {
    var text = "+%(_value)"

    Raylib.drawText(
      text, 
      _x, 
      _y, 
      SCORE_FONT_SIZE, 
      Color.new(255, 255, 255, _progress * 255.0)
    )
  }

}
