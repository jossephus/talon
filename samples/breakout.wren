import "raylib" for Color, Raylib, Rectangle, Vector2, KeyCode

var SCREEN_WIDTH = 800
var SCREEN_HEIGHT = 450

var PADDLE_BASE_WIDTH = 120
var PADDLE_HEIGHT = 18
var PADDLE_SPEED = 520

var BALL_RADIUS = 8
var BALL_BASE_SPEED = 280

var BRICK_ROWS = 6
var BRICK_COLUMNS = 10
var BRICK_WIDTH = 68
var BRICK_HEIGHT = 20
var BRICK_GAP = 6
var BRICK_TOP = 64

class Brick {
  construct new(rect, color) {
    _rect = rect
    _alive = true
    _color = color
  }

  rect { _rect }
  alive { _alive }
  color { _color }

  alive=(value) { _alive = value }
}

class Game {
  construct new() {
    _score = 0
    _lives = 3
    _state = "playing"

    _paddle = Rectangle.new(0, SCREEN_HEIGHT - 40, PADDLE_BASE_WIDTH, PADDLE_HEIGHT)
    _ball_pos = Vector2.new(0, 0)
    _ball_vel = Vector2.new(0, 0)

    _powerup_active = false
    _powerup_kind = ""
    _powerup_rect = Rectangle.new(0, 0, 18, 18)
    _paddle_boost_timer = 0

    _bricks = []
    rebuildBricks()
    resetBallAndPaddle()
  }

  rebuildBricks() {
    _bricks = []
    var start_x = (SCREEN_WIDTH - (BRICK_COLUMNS * BRICK_WIDTH + (BRICK_COLUMNS - 1) * BRICK_GAP)) / 2
    var colors = [Color.Blue, Color.SkyBlue, Color.Green, Color.Lime, Color.Gold, Color.Orange]

    for (row in 0...BRICK_ROWS) {
      for (col in 0...BRICK_COLUMNS) {
        var x = start_x + col * (BRICK_WIDTH + BRICK_GAP)
        var y = BRICK_TOP + row * (BRICK_HEIGHT + BRICK_GAP)
        var rect = Rectangle.new(x, y, BRICK_WIDTH, BRICK_HEIGHT)
        _bricks.add(Brick.new(rect, colors[row]))
      }
    }
  }

  resetBallAndPaddle() {
    _paddle.width = PADDLE_BASE_WIDTH
    _paddle.x = SCREEN_WIDTH / 2 - _paddle.width / 2
    _paddle.y = SCREEN_HEIGHT - 40

    _ball_pos.x = SCREEN_WIDTH / 2
    _ball_pos.y = SCREEN_HEIGHT - 80

    var dir = -1
    if (Raylib.getRandomValue(0, 1) == 0) dir = 1

    _ball_vel.x = BALL_BASE_SPEED * 0.7 * dir
    _ball_vel.y = -BALL_BASE_SPEED

    _powerup_active = false
    _powerup_kind = ""
    _paddle_boost_timer = 0
  }

  spawnPowerupAt(x, y) {
    if (_powerup_active) return

    if (Raylib.getRandomValue(0, 99) < 28) {
      _powerup_active = true
      _powerup_kind = "slow"
      if (Raylib.getRandomValue(0, 1) == 0) _powerup_kind = "wide"
      _powerup_rect.x = x - _powerup_rect.width / 2
      _powerup_rect.y = y - _powerup_rect.height / 2
    }
  }

  applyPowerup(kind) {
    if (kind == "wide") {
      _paddle.width = 180
      _paddle_boost_timer = 8
    } else if (kind == "slow") {
      _ball_vel.x = _ball_vel.x * 0.8
      _ball_vel.y = _ball_vel.y * 0.8
    }
  }

  update() {
    var dt = Raylib.getFrameTime()

    if (_state != "playing") {
      if (Raylib.isKeyPressed(KeyCode.KEY_ENTER)) {
        _score = 0
        _lives = 3
        _state = "playing"
        rebuildBricks()
        resetBallAndPaddle()
      }
      return
    }

    if (Raylib.isKeyDown(KeyCode.KEY_LEFT) || Raylib.isKeyDown(KeyCode.KEY_A)) {
      _paddle.x = _paddle.x - PADDLE_SPEED * dt
    }

    if (Raylib.isKeyDown(KeyCode.KEY_RIGHT) || Raylib.isKeyDown(KeyCode.KEY_D)) {
      _paddle.x = _paddle.x + PADDLE_SPEED * dt
    }

    if (_paddle.x < 0) _paddle.x = 0
    if (_paddle.x + _paddle.width > SCREEN_WIDTH) _paddle.x = SCREEN_WIDTH - _paddle.width

    if (_paddle_boost_timer > 0) {
      _paddle_boost_timer = _paddle_boost_timer - dt
      if (_paddle_boost_timer <= 0) {
        _paddle.width = PADDLE_BASE_WIDTH
      }
    }

    _ball_pos.x = _ball_pos.x + _ball_vel.x * dt
    _ball_pos.y = _ball_pos.y + _ball_vel.y * dt

    if (_ball_pos.x - BALL_RADIUS <= 0 && _ball_vel.x < 0) _ball_vel.x = -_ball_vel.x
    if (_ball_pos.x + BALL_RADIUS >= SCREEN_WIDTH && _ball_vel.x > 0) _ball_vel.x = -_ball_vel.x
    if (_ball_pos.y - BALL_RADIUS <= 0 && _ball_vel.y < 0) _ball_vel.y = -_ball_vel.y

    if (Raylib.checkCollisionCircleRec(_ball_pos, BALL_RADIUS, _paddle) && _ball_vel.y > 0) {
      var paddle_center = _paddle.x + _paddle.width / 2
      var offset = (_ball_pos.x - paddle_center) / (_paddle.width / 2)
      _ball_vel.y = -_ball_vel.y
      _ball_vel.x = _ball_vel.x + offset * 110
    }

    for (i in 0..._bricks.count) {
      if (!_bricks[i].alive) continue

      if (Raylib.checkCollisionCircleRec(_ball_pos, BALL_RADIUS, _bricks[i].rect)) {
        _bricks[i].alive = false
        _score = _score + 100
        _ball_vel.y = -_ball_vel.y
        spawnPowerupAt(_bricks[i].rect.x + _bricks[i].rect.width / 2, _bricks[i].rect.y + _bricks[i].rect.height / 2)
        break
      }
    }

    if (_powerup_active) {
      _powerup_rect.y = _powerup_rect.y + 140 * dt

      if (Raylib.checkCollisionRecs(_powerup_rect, _paddle)) {
        applyPowerup(_powerup_kind)
        _powerup_active = false
      } else if (_powerup_rect.y > SCREEN_HEIGHT) {
        _powerup_active = false
      }
    }

    if (_ball_pos.y - BALL_RADIUS > SCREEN_HEIGHT) {
      _lives = _lives - 1
      if (_lives <= 0) {
        _state = "lost"
      } else {
        resetBallAndPaddle()
      }
    }

    var alive_bricks = 0
    for (brick in _bricks) {
      if (brick.alive) alive_bricks = alive_bricks + 1
    }

    if (alive_bricks == 0) {
      _state = "won"
    }
  }

  draw() {
    Raylib.beginDrawing()
    Raylib.clearBackground(Color.RayWhite)

    Raylib.drawText("Breakout + Powerups", 16, 14, 24, Color.DarkBlue)
    Raylib.drawText("Score: %(_score)", 16, 42, 20, Color.DarkGray)
    Raylib.drawText("Lives: %(_lives)", SCREEN_WIDTH - 104, 42, 20, Color.DarkGray)

    Raylib.drawRectangleRec(_paddle, Color.DarkBlue)
    Raylib.drawCircleV(_ball_pos, BALL_RADIUS, Color.Maroon)

    for (brick in _bricks) {
      if (!brick.alive) continue
      Raylib.drawRectangleRec(brick.rect, brick.color)
      Raylib.drawRectangleLinesEx(brick.rect, 1, Color.White)
    }

    if (_powerup_active) {
      var color = Color.Purple
      if (_powerup_kind == "wide") color = Color.Gold
      Raylib.drawRectangleRec(_powerup_rect, color)
      Raylib.drawRectangleLinesEx(_powerup_rect, 2, Color.DarkGray)
    }

    if (_state == "won") {
      Raylib.drawRectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new(0, 0, 0, 90))
      Raylib.drawText("YOU WIN!", SCREEN_WIDTH / 2 - 96, SCREEN_HEIGHT / 2 - 24, 42, Color.Lime)
      Raylib.drawText("Press ENTER to play again", SCREEN_WIDTH / 2 - 150, SCREEN_HEIGHT / 2 + 30, 22, Color.RayWhite)
    }

    if (_state == "lost") {
      Raylib.drawRectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new(0, 0, 0, 90))
      Raylib.drawText("GAME OVER", SCREEN_WIDTH / 2 - 114, SCREEN_HEIGHT / 2 - 24, 42, Color.Red)
      Raylib.drawText("Press ENTER to retry", SCREEN_WIDTH / 2 - 118, SCREEN_HEIGHT / 2 + 30, 22, Color.RayWhite)
    }

    Raylib.drawText("Move: LEFT/RIGHT or A/D", 16, SCREEN_HEIGHT - 28, 18, Color.Gray)

    Raylib.endDrawing()
  }
}

Raylib.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [talon] breakout + powerups")

var game = Game.new()

Raylib.setTargetFPS(60)

while (!Raylib.windowShouldClose()) {
  game.update()
  game.draw()
}

Raylib.closeWindow()
