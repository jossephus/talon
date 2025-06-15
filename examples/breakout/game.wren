import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D
import "math" for Math
import "./brick" for Brick, BRICK_W
import "./ball" for Ball, BALL_W, BALL_H
import "./paddle" for Paddle, PADDLE_SPEED, PADDLE_W
import "./score" for ScoreIndicator, SCORE_INC_Y, SCORE_PROG_INC_Y
import "./utils" for SCREEN_HEIGHT, SCREEN_WIDTH

var width = 600
var height = 800

var CAMERA_SHAKE_DEC = 0.8 
var CAMERA_SHAKE_TTL = 10.0


class GameStatus {
    static Start { "Start" }
    static Playing { "Playing" }
    static Won { "Won" }
    static Over { "Over" }
}

class Game {
    construct new() {
        _brick_texture = Texture2D.loadTexture("res/brick.png")
        _ball_texture = Texture2D.loadTexture("res/tennis.png")
        _paddle_texture = Texture2D.loadTexture("res/paddle.png")
        _status = GameStatus.Start
        _bricks = Brick.new_bricks(5, 10)
        _ball = Ball.new()
        _paddle = Paddle.new()
        _camera_shake_ttl = 0.0
        _particle_instances = []
        _score = 0.0
        _camera = Camera2D.new(
           Vector2.new(0.0, 0.0), 
           Vector2.new(0.0, 0.0),
           0.0, 
           1.0
        )
        _score_indicators = []
        _score_multiplier = 1
    }

    restart() {
        _brick_texture = Texture2D.loadTexture("res/brick.png")
        _ball_texture = Texture2D.loadTexture("res/tennis.png")
        _paddle_texture = Texture2D.loadTexture("res/paddle.png")
        _status = GameStatus.Start
        _bricks = Brick.new_bricks(5, 10)
        _ball = Ball.new()
        _paddle = Paddle.new()
        _camera_shake_ttl = 0.0
        _particle_instances = []
        _score = 0.0
        _camera = Camera2D.new(
           Vector2.new(0.0, 0.0), 
           Vector2.new(0.0, 0.0),
           0.0, 
           1.0
        )
        _score_indicators = []
        _score_multiplier = 1
    }



    draw() {
      if (_status == GameStatus.Start) {
        draw_start()
      } else if (_status == GameStatus.Playing) {
        draw_playing()
      } else if (_status == GameStatus.Won) {
        draw_won()
      } else if (_status == GameStatus.Over) {
        draw_over()
      }
    }

    update() {
      if (_status == GameStatus.Start) {
        update_start()
      } else if (_status == GameStatus.Playing) {
        update_playing()
      } else if (_status == GameStatus.Won) {
        update_won()
      } else if (_status == GameStatus.Over) {
        update_over()
      }
    }


    draw_start() {
      Raylib.clearBackground(Color.new(0, 0, 0, 255))
      var tx = 30
      var font_size = 22 
      var text = "use left and right arrow keys to move"
      Raylib.drawText(text, tx, 800 / 2, font_size, Color.new(255, 255, 255, 255))

      var text2 = "press <space> to start"
      Raylib.drawText(text2, tx, 800 / 2 + font_size, font_size,  Color.new(255, 255, 255, 255))
    }

    update_start() {
      if (Raylib.isKeyDown(KeyCode.KEY_SPACE)) {
        _status = GameStatus.Playing
      }
    }

    update_playing() {
      var dt = Raylib.getFrameTime()

      var i = 0 

      while (i < _bricks.count) {
        var b = _bricks[i]
        var collided = Raylib.checkCollisionRecs(_ball.rec, b.rec)

        if (!collided) {
          i = i + 1 
          continue
        }

        _ball.apply_collission(b.rec)

        _camera_shake_ttl = CAMERA_SHAKE_TTL

        _score_indicators.add(ScoreIndicator.new(_score_multiplier, b.rec.x + BRICK_W / 2.0, b.rec.y))

        _score = _score + 1 * _score_multiplier 
        _score_multiplier = _score_multiplier +  1

        _bricks.removeAt(i)

        if (_bricks.count == 0) {
          _status = GameStatus.Won
          return
        }
      }

      if (Raylib.checkCollisionRecs(_ball.rec, _paddle.rec)) {
        _score_multiplier = 1 

        if (_ball.rec.x + BALL_W / 2.0 < _paddle.rec.x + PADDLE_W / 2.0) {
          _ball.vel.x = -PADDLE_SPEED
        } else {
          _ball.vel.x = PADDLE_SPEED
        }
        _ball.vel.y = _ball.vel.y * -1.0 
        _ball.rec.y = _ball.rec.y - BALL_H
      }

      _ball.rec.x = _ball.rec.x + _ball.vel.x * dt 
      _ball.rec.y = _ball.rec.y + _ball.vel.y * dt 

      var c_left = _ball.rec.x < 0.0
      var c_up = _ball.rec.y < 0.0
      var c_right = _ball.rec.x + _ball.rec.width >  SCREEN_WIDTH
      var c_down = _ball.rec.y + _ball.rec.height > SCREEN_HEIGHT

      if (c_left || c_right) {
        _ball.vel.x = _ball.vel.x * -1.0
      }
      if (c_up) {
        self.ball.vel.y = _ball.vel.y * -1.0
      }
      if (c_down) {
          _status = GameStatus.Over
          return
      }

      if (Raylib.isKeyDown(KeyCode.KEY_LEFT)) {
        _paddle.rec.x = _paddle.rec.x - PADDLE_SPEED * dt
      }

      if (Raylib.isKeyDown(KeyCode.KEY_RIGHT)) {
        _paddle.rec.x = _paddle.rec.x + PADDLE_SPEED * dt
      }

      var j = 0

       while (j < _score_indicators.count) {
            var s = _score_indicators[j]
            var new_p = 1.0 - Math.pow(1.0 - s.progress, 5.0)
            s.progress = s.progress + SCORE_PROG_INC_Y
            s.pos.y = s.start_y - SCORE_INC_Y * new_p
            if (s.progress > 1.0) {
                _score_indicators.removeAt(j)
            } else {
                j = j + 1
            }
        }

    }

    draw_playing() {
        _camera_shake_ttl = Math.max(0.0, _camera_shake_ttl - CAMERA_SHAKE_DEC)
        // _camera.offset.y = Math.sin(_camera_shake_ttl * 2.0) * 2.0 * _camera_shake_ttl / CAMERA_SHAKE_TTL
        // _camera.target.x = Math.sin(_camera_shake_ttl * 4.0) * 2.0 * _camera_shake_ttl / CAMERA_SHAKE_TTL

        _camera.beginMode2D()

        Raylib.clearBackground(Color.new(0, 0,  0, 255))

        for (brick in _bricks) {
            brick.draw(_brick_texture)
        }

        for (particle in _particle_instances) {
            particle.draw()
        }

        _paddle.draw(_paddle_texture)
        _ball.draw(_ball_texture)

        _camera.endMode2D()

//        for (self.score_indicators.items) |s| {
//            s.draw()
//        }

        var fps_text = "Score %(_score)"

        Raylib.drawText(fps_text, 12, 12, 24, Color.new(255, 255, 255, 255 ))
      }

  draw_over() {
    Raylib.clearBackground(Color.new(0, 0, 0 , 255))

    var tx = 30
    var font_size = 22
    var text = "You lose"
    Raylib.drawText(text, tx, SCREEN_HEIGHT / 2, font_size, Color.new(255, 255, 255, 255))

    var text_2 = "press <space> to start"
    Raylib.drawText(text_2, tx, 800 / 2 + font_size * 2, font_size, Color.new(255, 255, 255, 255))

  }

  update_over() {
    if (Raylib.isKeyDown(KeyCode.KEY_SPACE)) {
      restart()
    }
  }
}
