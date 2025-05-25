import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D
import "math" for Math

var MAX_BUILDINGS = 100

var screenWidth = 800 
var screenHeight = 450

Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - 2d camera")

var player = Rectangle.new(400, 280, 40, 40)
var buildings = []
var buildColors = []

var spacing = 0

var i = 0

while (i < MAX_BUILDINGS) {
  var height = Raylib.getRandomValue(100, 800)
  var random =  Raylib.getRandomValue(50, 200)
  
  var building = Rectangle.new(
    -6000 + spacing, 
    screenHeight - 130.0 - height,
    random,
    height
  )

  buildings.add(building)

  spacing = spacing + building.width 

  buildColors.add(Color.new(
    Raylib.getRandomValue(200, 240),
    Raylib.getRandomValue(200, 240),
    Raylib.getRandomValue(200, 250),
    255
  ))

  i = i + 1
}

var camera = Camera2D.new(
  Vector2.new(screenWidth / 2.0, screenHeight / 2.0), 
  Vector2.new(player.x + 20.0, player.y + 20.0),
  1.0,
  0.0
)

Raylib.setTargetFPS(60)               // Set our game to run at 60 frames-per-secon

while (!Raylib.windowShouldClose()) {

  if (Raylib.isKeyDown(KeyCode.KEY_RIGHT)) { 
    player.x = player.x + 2 
  } else if (Raylib.isKeyDown(KeyCode.KEY_LEFT)) { player.x = player.x - 2 }

  camera.target = Vector2.new(player.x + 20, player.y + 20)

  if (Raylib.isKeyDown(KeyCode.KEY_A)) { 
    camera.rotation = camera.rotation - 1 
  } else if (Raylib.isKeyDown(KeyCode.KEY_S)) { 
    camera.rotation = camera.rotation + 1 
  }

  if (camera.rotation > 40) {
    camera.rotation = 40
  } else if (camera.rotation < -40) { camera.rotation = -40 }

  camera.zoom = Math.exp(Math.log(camera.zoom) + (Raylib.getMouseWheelMove() * 0.1))

  if (camera.zoom > 3.0) { 
    camera.zoom = 3.0 
  } else if (camera.zoom < 0.1) { 
    camera.zoom = 0.1 
  }

  if (Raylib.isKeyDown(KeyCode.KEY_R)) {
      camera.zoom = 1.0
      camera.rotation = 0.0
  }
  Raylib.beginDrawing()

  Raylib.clearBackground(Color.RayWhite)

      Raylib.beginMode2D(camera)

          Raylib.drawRectangle(-6000, 320, 13000, 8000, Color.DarkGray)

          var i = 0
          while (i < MAX_BUILDINGS) {
            Raylib.drawRectangleRec(buildings[i], buildColors[i])
            i = i + 1
          }

          Raylib.drawRectangleRec(player, Color.Red)

      Raylib.drawLine(camera.target.x, -screenHeight*10, camera.target.x, screenHeight*10, Color.Green)
      Raylib.drawLine(-screenWidth*10, camera.target.y, screenWidth*10, camera.target.y, Color.Green)

      Raylib.endMode2D()

      Raylib.drawText("SCREEN AREA", 640, 10, 20, Color.Red)

      Raylib.drawRectangle(0, 0, screenWidth, 5, Color.Red)
      Raylib.drawRectangle(0, 5, 5, screenHeight - 10, Color.Red)
      Raylib.drawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, Color.Red)
      Raylib.drawRectangle(0, screenHeight - 5, screenWidth, 5, Color.Red)

      Raylib.drawRectangle( 10, 10, 250, 113, Color.SkyBlue )
      Raylib.drawRectangleLines( 10, 10, 250, 113, Color.Blue)

      Raylib.drawText("Free 2d camera controls:", 20, 20, 10, Color.Black)
      Raylib.drawText("- Right/Left to move Offset", 40, 40, 10, Color.DarkGray)
      Raylib.drawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, Color.DarkGray)
      Raylib.drawText("- A / S to Rotate", 40, 80, 10, Color.DarkGray)
      Raylib.drawText("- R to reset Zoom and Rotation", 40, 100, 10, Color.DarkGray)

  Raylib.endDrawing()
}

Raylib.closeWindow()
