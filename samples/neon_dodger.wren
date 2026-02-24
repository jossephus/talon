import "raylib" for Color, Raylib, Vector2, KeyCode

var SCREEN_WIDTH = 800
var SCREEN_HEIGHT = 450

var PLAYER_RADIUS = 12
var PLAYER_SPEED = 250
var DASH_MULTIPLIER = 2.8
var DASH_DURATION = 0.14
var DASH_COOLDOWN = 1.0

class Hazard {
  construct new(position, velocity, radius, color) {
    _position = position
    _velocity = velocity
    _radius = radius
    _color = color
  }

  position { _position }
  velocity { _velocity }
  radius { _radius }
  color { _color }
}

class Pickup {
  construct new() {
    _active = false
    _position = Vector2.new(0, 0)
    _radius = 10
  }

  active { _active }
  position { _position }
  radius { _radius }

  active=(value) { _active = value }
}

class Game {
  construct new() {
    _player = Vector2.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
    _hazards = []
    _pickup = Pickup.new()

    _state = "playing"
    _frames_survived = 0
    _best_score = 0

    _elapsed = 0
    _spawn_timer = 0
    _spawn_interval = 0.9

    _dash_timer = 0
    _dash_cooldown_timer = 0
    _shield_timer = 0

    _pickup_timer = 10
    _scanline_offset = 0
  }

  resetRound() {
    _player.x = SCREEN_WIDTH / 2
    _player.y = SCREEN_HEIGHT / 2
    _hazards = []
    _pickup.active = false

    _state = "playing"
    _frames_survived = 0
    _elapsed = 0
    _spawn_timer = 0
    _spawn_interval = 0.9

    _dash_timer = 0
    _dash_cooldown_timer = 0
    _shield_timer = 0
    _pickup_timer = 10
  }

  spawnHazard() {
    var side = Raylib.getRandomValue(0, 3)
    var speed_base = 120 + _elapsed * 7
    var speed = speed_base + Raylib.getRandomValue(0, 90)

    var x = 0
    var y = 0
    var vx = 0
    var vy = 0

    if (side == 0) {
      x = -24
      y = Raylib.getRandomValue(0, SCREEN_HEIGHT)
      vx = speed
      vy = Raylib.getRandomValue(-80, 80)
    } else if (side == 1) {
      x = SCREEN_WIDTH + 24
      y = Raylib.getRandomValue(0, SCREEN_HEIGHT)
      vx = -speed
      vy = Raylib.getRandomValue(-80, 80)
    } else if (side == 2) {
      x = Raylib.getRandomValue(0, SCREEN_WIDTH)
      y = -24
      vx = Raylib.getRandomValue(-100, 100)
      vy = speed
    } else {
      x = Raylib.getRandomValue(0, SCREEN_WIDTH)
      y = SCREEN_HEIGHT + 24
      vx = Raylib.getRandomValue(-100, 100)
      vy = -speed
    }

    var radius = Raylib.getRandomValue(7, 14)
    var color = Color.SkyBlue
    if (Raylib.getRandomValue(0, 1) == 0) color = Color.Pink

    _hazards.add(Hazard.new(Vector2.new(x, y), Vector2.new(vx, vy), radius, color))
  }

  spawnPickup() {
    if (_pickup.active) return

    _pickup.active = true
    _pickup.position.x = Raylib.getRandomValue(80, SCREEN_WIDTH - 80)
    _pickup.position.y = Raylib.getRandomValue(90, SCREEN_HEIGHT - 90)
  }

  applyMovement(dt) {
    var dx = 0
    var dy = 0

    if (Raylib.isKeyDown(KeyCode.KEY_LEFT) || Raylib.isKeyDown(KeyCode.KEY_A)) dx = dx - 1
    if (Raylib.isKeyDown(KeyCode.KEY_RIGHT) || Raylib.isKeyDown(KeyCode.KEY_D)) dx = dx + 1
    if (Raylib.isKeyDown(KeyCode.KEY_UP) || Raylib.isKeyDown(KeyCode.KEY_W)) dy = dy - 1
    if (Raylib.isKeyDown(KeyCode.KEY_DOWN) || Raylib.isKeyDown(KeyCode.KEY_S)) dy = dy + 1

    if (Raylib.isKeyPressed(KeyCode.KEY_SPACE) && _dash_cooldown_timer <= 0) {
      _dash_timer = DASH_DURATION
      _dash_cooldown_timer = DASH_COOLDOWN
    }

    var move_speed = PLAYER_SPEED
    if (_dash_timer > 0) move_speed = move_speed * DASH_MULTIPLIER

    _player.x = _player.x + dx * move_speed * dt
    _player.y = _player.y + dy * move_speed * dt

    if (_player.x < PLAYER_RADIUS) _player.x = PLAYER_RADIUS
    if (_player.x > SCREEN_WIDTH - PLAYER_RADIUS) _player.x = SCREEN_WIDTH - PLAYER_RADIUS
    if (_player.y < PLAYER_RADIUS + 28) _player.y = PLAYER_RADIUS + 28
    if (_player.y > SCREEN_HEIGHT - PLAYER_RADIUS) _player.y = SCREEN_HEIGHT - PLAYER_RADIUS
  }

  updateHazards(dt) {
    var next_hazards = []

    for (hazard in _hazards) {
      hazard.position.x = hazard.position.x + hazard.velocity.x * dt
      hazard.position.y = hazard.position.y + hazard.velocity.y * dt

      var outside = false
      if (hazard.position.x < -40) outside = true
      if (hazard.position.x > SCREEN_WIDTH + 40) outside = true
      if (hazard.position.y < -40) outside = true
      if (hazard.position.y > SCREEN_HEIGHT + 40) outside = true

      if (!outside) next_hazards.add(hazard)
    }

    _hazards = next_hazards
  }

  update() {
    var dt = Raylib.getFrameTime()

    _scanline_offset = _scanline_offset + 1
    if (_scanline_offset >= 28) _scanline_offset = 0

    if (_state == "gameover") {
      if (Raylib.isKeyPressed(KeyCode.KEY_ENTER)) {
        resetRound()
      }
      return
    }

    _elapsed = _elapsed + dt
    _frames_survived = _frames_survived + 1

    if (_dash_timer > 0) _dash_timer = _dash_timer - dt
    if (_dash_cooldown_timer > 0) _dash_cooldown_timer = _dash_cooldown_timer - dt
    if (_shield_timer > 0) _shield_timer = _shield_timer - dt

    applyMovement(dt)

    _spawn_interval = 0.9 - _elapsed * 0.03
    if (_spawn_interval < 0.18) _spawn_interval = 0.18

    _spawn_timer = _spawn_timer - dt
    if (_spawn_timer <= 0) {
      spawnHazard()
      if (_elapsed > 20 && Raylib.getRandomValue(0, 99) < 35) {
        spawnHazard()
      }
      _spawn_timer = _spawn_interval
    }

    _pickup_timer = _pickup_timer - dt
    if (_pickup_timer <= 0) {
      spawnPickup()
      _pickup_timer = Raylib.getRandomValue(10, 16)
    }

    if (_pickup.active && Raylib.checkCollisionCircles(_player, PLAYER_RADIUS, _pickup.position, _pickup.radius)) {
      _pickup.active = false
      _shield_timer = 4.0
    }

    updateHazards(dt)

    var invincible = (_dash_timer > 0 || _shield_timer > 0)

    if (!invincible) {
      for (hazard in _hazards) {
        if (Raylib.checkCollisionCircles(_player, PLAYER_RADIUS, hazard.position, hazard.radius)) {
          _state = "gameover"
          var score = _frames_survived / 6
          if (score > _best_score) _best_score = score
          break
        }
      }
    }
  }

  drawBackground() {
    Raylib.clearBackground(Color.new(10, 12, 24, 255))

    for (i in 0...30) {
      var y = i * 28 + _scanline_offset
      Raylib.drawLine(0, y, SCREEN_WIDTH, y, Color.new(32, 45, 78, 180))
    }

    for (x in 0...16) {
      var col = x * 50
      Raylib.drawLine(col, 28, col, SCREEN_HEIGHT, Color.new(24, 38, 70, 130))
    }
  }

  drawHud() {
    var score = _frames_survived / 6

    Raylib.drawText("NEON DODGER", 14, 10, 24, Color.SkyBlue)
    Raylib.drawText("Score: %(score)", 14, 40, 20, Color.RayWhite)
    Raylib.drawText("Best: %(_best_score)", 14, 62, 18, Color.LightGray)

    var dash_text = "Dash: READY"
    if (_dash_cooldown_timer > 0) {
      var left = _dash_cooldown_timer
      if (left < 0) left = 0
      dash_text = "Dash: %(left)"
    }

    Raylib.drawText(dash_text, SCREEN_WIDTH - 150, 40, 18, Color.Gold)
    Raylib.drawText("Move: Arrows/WASD  Dash: SPACE", 14, SCREEN_HEIGHT - 26, 18, Color.Gray)
  }

  draw() {
    Raylib.beginDrawing()

    drawBackground()
    drawHud()

    for (hazard in _hazards) {
      Raylib.drawCircleV(hazard.position, hazard.radius, hazard.color)
      Raylib.drawCircleLines(hazard.position.x, hazard.position.y, hazard.radius + 2, Color.White)
    }

    if (_pickup.active) {
      Raylib.drawCircleV(_pickup.position, _pickup.radius, Color.Lime)
      Raylib.drawCircleLines(_pickup.position.x, _pickup.position.y, _pickup.radius + 3, Color.RayWhite)
    }

    var player_color = Color.Gold
    if (_shield_timer > 0) player_color = Color.Lime
    if (_dash_timer > 0) player_color = Color.Orange

    Raylib.drawCircleV(_player, PLAYER_RADIUS, player_color)
    Raylib.drawCircleLines(_player.x, _player.y, PLAYER_RADIUS + 3, Color.RayWhite)

    if (_state == "gameover") {
      Raylib.drawRectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Color.new(0, 0, 0, 140))
      Raylib.drawText("YOU GOT TAGGED", SCREEN_WIDTH / 2 - 128, SCREEN_HEIGHT / 2 - 38, 36, Color.Pink)
      Raylib.drawText("Press ENTER to play again", SCREEN_WIDTH / 2 - 148, SCREEN_HEIGHT / 2 + 16, 22, Color.RayWhite)
    }

    Raylib.endDrawing()
  }
}

Raylib.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [talon] neon dodger")

var game = Game.new()

Raylib.setTargetFPS(60)

while (!Raylib.windowShouldClose()) {
  game.update()
  game.draw()
}

Raylib.closeWindow()
