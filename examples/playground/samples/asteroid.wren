import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D, Vector3
import "math" for Math


var PLAYER_BASE_SIZE = 20
var PLAYER_SPEED = 6.0
var PLAYER_MAX_SHOOTS = 10 
var DEG2RAD = 0.017453

var METEORS_SPEED = 2 
var MAX_MEDIUM_METEORS = 8 
var MAX_SMALL_METEORS = 16

var ScreenWidth = 800
var ScreenHeight = 450

class Meteor {
  construct new(position, speed, radius, active, color) {
    _position = position 
    _speed = speed 
    _radius = radius
    _active = active 
    _color = color
  }
  
  position { _position }
  speed { _speed }
  active { _active }
  color { _color }
  radius { _radius }

  position=(value) { _position = value }
  speed=(value) { _speed = value }
  active=(value) { _active = value }
  color=(value) { _color = value }
  radius=(value) { _radius = value }
}

class Player {
  construct new(position, speed, acceleration, rotation, collider, color) {
    _position = position
    _speed = speed 
    _acceleration = acceleration 
    _rotation = rotation 
    _collider = collider
    _color = color
  }
  position { _position }
  speed { _speed }
  acceleration { _acceleration }
  rotation { _rotation }
  collider { _collider }
  color { _color }

  position=(value) { _position = value }
  speed=(value) { _speed = value }
  acceleration=(value) { _acceleration = value }
  rotation=(value) { _rotation = value }
  collider=(value) { _collider = value }
  color=(value) { _color = value }
}


class Game {
  initGame() {
    var posx = 0
    var posy = 0
    var velx = 0
    var vely = 0
    var correctRange = false

    _pause = false
    _gameOver = false
    _framesCounter = 0
    _shipHeight = (PLAYER_BASE_SIZE / 2) / Math.tan(20 * DEG2RAD)

    _mediumMeteor = []
    _smallMeteor = []

    var x = ScreenWidth / 2
    var y = ScreenHeight / 2 - _shipHeight / 2

    _player = Player.new(
       Vector2.new(x, y),
       Vector2.new(0, 0), 
       0, 
       0, 
       Vector3.new(
        x + Math.sin(0 * DEG2RAD) * (_shipHeight / 2.5),
        y - Math.cos(0 * DEG2RAD) * (_shipHeight / 2.5),
        12),
      Color.LightGray
    )

    for (i in 0...MAX_MEDIUM_METEORS) {

       posx = Raylib.getRandomValue(0, ScreenWidth)

        while (!correctRange) {
            if (posx > ScreenWidth/2 - 150 && posx < ScreenWidth/2 + 150) {
              posx = Raylib.getRandomValue(0, ScreenWidth)
            } else { 
              correctRange = true
            }
        }

        correctRange = false

        posy = Raylib.getRandomValue(0, ScreenHeight)

        while (!correctRange) {
            if (posy > ScreenHeight/2 - 150 && posy < ScreenHeight/2 + 150)  {
              posy = Raylib.getRandomValue(0, ScreenHeight)
            } else {
              correctRange = true
            }
        }

        correctRange = false
        velx = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
        vely = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)

        while (!correctRange) {
            if (velx == 0 && vely == 0) {
                velx = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
                vely = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
            } else {
              correctRange = true
            }
        }
        _mediumMeteor.add(
           Meteor.new(Vector2.new(posx, posy), Vector2.new(velx, vely), 20, true, Color.Green)
        )
    }

    for (j in 0...MAX_SMALL_METEORS) {
       posx = Raylib.getRandomValue(0, ScreenWidth)

        while (!correctRange) {
            if (posx > ScreenWidth/2 - 150 && posx < ScreenWidth/2 + 150) {
              posx = Raylib.getRandomValue(0, ScreenWidth)
            } else { 
              correctRange = true
            }
        }

        correctRange = false

        posy = Raylib.getRandomValue(0, ScreenHeight)

        while (!correctRange) {
            if (posy > ScreenHeight/2 - 150 && posy < ScreenHeight/2 + 150)  {
              posy = Raylib.getRandomValue(0, ScreenHeight)
            } else {
              correctRange = true
            }
        }

        correctRange = false
        velx = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
        vely = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)

        while (!correctRange) {
            if (velx == 0 && vely == 0) {
                velx = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
                vely = Raylib.getRandomValue(-METEORS_SPEED, METEORS_SPEED)
            } else {
              correctRange = true
            }
        }
        _smallMeteor.add(
           Meteor.new(Vector2.new(posx, posy), Vector2.new(velx, vely), 20, true, Color.Yellow)
        )
    }


  }

  construct new() {
    initGame()
  }

  player { _player }
  mediumMeteor { _mediumMeteor }
  smallMeteor { _smallMeteor }

  update() {
    if (!_gameOver) {
        if (Raylib.isKeyDown(KeyCode.KEY_P)) {
          _pause = !_pause
        }

        if (!_pause) {
            _framesCounter = _framesCounter + 1

            // Rotation
            if (Raylib.isKeyDown(KeyCode.KEY_LEFT)) {
              _player.rotation = player.rotation - 5
            }
            if (Raylib.isKeyDown(KeyCode.KEY_RIGHT)) {
              System.print("Right is clicked")
              _player.rotation = _player.rotation + 5
            }

            // Speed
            _player.speed.x = Math.sin(_player.rotation*DEG2RAD)*PLAYER_SPEED
            _player.speed.y = Math.cos(_player.rotation*DEG2RAD)*PLAYER_SPEED

            // Controller
            if (Raylib.isKeyDown(KeyCode.KEY_UP)) {
              System.print("UP IS CLICKING")
                if (_player.acceleration < 1) _player.acceleration = _player.acceleration + 0.04
            } else {
                if (_player.acceleration > 0) { 
                  _player.acceleration = _player.acceleration - 0.02
                } else if (player.acceleration < 0) {
                  _player.acceleration = 0 
                }
            }
            if (Raylib.isKeyDown(KeyCode.KEY_DOWN)) {
                if (_player.acceleration > 0) {
                 _player.acceleration = _player.acceleration - 0.04
                } else if (_player.acceleration < 0) {
                  _player.acceleration = 0
                }
            }

            // Movement
            _player.position.x = _player.position.x + (_player.speed.x*_player.acceleration)
            _player.position.y = _player.position.y - (player.speed.y * player.acceleration)

            // Wall behaviour for player
            if (_player.position.x > ScreenWidth + _shipHeight) {
              _player.position.x = -(_shipHeight)
            } else if (_player.position.x < -(_shipHeight)) {
              player.position.x = ScreenWidth + _shipHeight
            }
            if (player.position.y > (ScreenHeight + _shipHeight)) {
              player.position.y = -(_shipHeight)
            } else if (_player.position.y < -(_shipHeight)) {
              _player.position.y = ScreenHeight + _shipHeight
            }

            // Collision Player to meteors
            _player.collider = Vector3.new(player.position.x + Math.sin(player.rotation*DEG2RAD)*(_shipHeight/2.5), player.position.y - Math.cos(player.rotation*DEG2RAD)*(_shipHeight/2.5), 12)


            for (i in 0...MAX_MEDIUM_METEORS) {
                if (Raylib.checkCollisionCircles(Vector2.new(player.collider.x, player.collider.y), player.collider.z, _mediumMeteor[i].position, _mediumMeteor[i].radius) && _mediumMeteor[i].active) {
                  _gameOver = true
            }
            }

            for (a in 0...MAX_SMALL_METEORS) {
                if (Raylib.checkCollisionCircles(Vector2.new(player.collider.x, player.collider.y), player.collider.z, _smallMeteor[a].position, _smallMeteor[a].radius) && _smallMeteor[a].active) {
                 _gameOver = true
                }
            }

            // Meteor logic

            for (i in 0...MAX_MEDIUM_METEORS) {
                if (mediumMeteor[i].active) {
                    // movement
                    mediumMeteor[i].position.x = mediumMeteor[i].position.x + mediumMeteor[i].speed.x
                    mediumMeteor[i].position.y = mediumMeteor[i].position.y + mediumMeteor[i].speed.y

                    if  (mediumMeteor[i].position.x > ScreenWidth + mediumMeteor[i].radius) mediumMeteor[i].position.x = -(mediumMeteor[i].radius) else if (mediumMeteor[i].position.x < 0 - mediumMeteor[i].radius) {
                      mediumMeteor[i].position.x = ScreenWidth + mediumMeteor[i].radius
                    }
                    if (mediumMeteor[i].position.y > ScreenHeight + mediumMeteor[i].radius) mediumMeteor[i].position.y = -(mediumMeteor[i].radius) else if (mediumMeteor[i].position.y < 0 - mediumMeteor[i].radius) {
                      mediumMeteor[i].position.y = ScreenHeight + mediumMeteor[i].radius
                    }
                }
            }
            for (i in 0...MAX_SMALL_METEORS) {
                if (smallMeteor[i].active) {
                    // movement
                    smallMeteor[i].position.x = smallMeteor[i].position.x + smallMeteor[i].speed.x
                    smallMeteor[i].position.y = smallMeteor[i].position.y + smallMeteor[i].speed.y

                    if  (smallMeteor[i].position.x > ScreenWidth + smallMeteor[i].radius) smallMeteor[i].position.x = -(smallMeteor[i].radius) else if (smallMeteor[i].position.x < 0 - smallMeteor[i].radius) {
                      smallMeteor[i].position.x = ScreenWidth + smallMeteor[i].radius 
                    }
                    if (smallMeteor[i].position.y > ScreenHeight + smallMeteor[i].radius) smallMeteor[i].position.y = -(smallMeteor[i].radius) else if (smallMeteor[i].position.y < 0 - smallMeteor[i].radius) {
                      smallMeteor[i].position.y = ScreenHeight + smallMeteor[i].radius
                    }
                }
            }
        }
    } else {
        if (Raylib.isKeyDown(KeyCode.KEY_ENTER)) {
            _gameOver = false
            initGame()
        }
    }
  }

  draw() {
    Raylib.beginDrawing()

        Raylib.clearBackground(Color.RayWhite)

        if (!_gameOver) {
            // Draw spaceship
            var v1 = Vector2.new(player.position.x + Math.sin(player.rotation*DEG2RAD)*(_shipHeight), player.position.y - Math.cos(player.rotation*DEG2RAD)*(_shipHeight))
            var v2 = Vector2.new(
              player.position.x - Math.cos(player.rotation * DEG2RAD) * (PLAYER_BASE_SIZE / 2),
              player.position.y - Math.sin(player.rotation * DEG2RAD) * (PLAYER_BASE_SIZE / 2)
            )
            var v3 = Vector2.new(
              player.position.x + Math.cos(player.rotation * DEG2RAD) * (PLAYER_BASE_SIZE / 2),
              player.position.y + Math.sin(player.rotation * DEG2RAD) * (PLAYER_BASE_SIZE / 2)
            )

            Raylib.drawTriangle(v1, v2, v3, Color.Maroon)

            // Draw meteor
            for (i in 0...MAX_MEDIUM_METEORS) {
                if (mediumMeteor[i].active) Raylib.drawCircleV(mediumMeteor[i].position, mediumMeteor[i].radius, Color.Gray) else Raylib.drawCircleV(mediumMeteor[i].position, mediumMeteor[i].radius, Color.LightGray)
            }

            for (i in 0...MAX_SMALL_METEORS) {
                if (smallMeteor[i].active) Raylib.drawCircleV(smallMeteor[i].position, smallMeteor[i].radius, Color.DarkGray) else Raylib.drawCircleV(smallMeteor[i].position, smallMeteor[i].radius, Color.LightGray)
            }

            Raylib.drawText("TIME: %(_framesCounter / 60)", 10, 10, 20, Color.Black)

            if (_pause) Raylib.drawText("GAME PAUSED", 20, 40/2, ScreenHeight/2 - 40, 40, Color.Gray)
        } else {
            Raylib.drawText("PRESS [ENTER] TO PLAY AGAIN", 20, Raylib.getScreenHeight()/2 - 50, 20, Color.Gray)
        }

    Raylib.endDrawing()


  }
}

Raylib.initWindow(ScreenWidth, ScreenHeight, "classic game: asteroids survival")

var game = Game.new()

Raylib.setTargetFPS(60)

while (!Raylib.windowShouldClose()) {
  game.update()
  game.draw()
}

Raylib.closeWindow()
