import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D

class GameScreen {
  static Logo { 0 }
  static Title { 1 }
  static GamePlay { 2 }
  static Ending { 3 }
}

var screenWidth = 800 
var screenHeight = 450

Raylib.initWindow(screenWidth, screenHeight, "raylib [core] example - basic screen manager")

var currentScreen = GameScreen.Logo

var framesCounter = 0

Raylib.setTargetFPS(60)

while (!Raylib.windowShouldClose()) {
  if (currentScreen == GameScreen.Logo) {
    framesCounter = framesCounter + 1
    if (framesCounter > 120) {
      currentScreen = GameScreen.Title
    }
  }

  if (currentScreen == GameScreen.Title) {
    if (Raylib.isKeyPressed(KeyCode.KEY_ENTER)) {
      currentScreen = GameScreen.GamePlay
    }
  }

  if (currentScreen == GameScreen.GamePlay) {
    if (Raylib.isKeyPressed(KeyCode.KEY_ENTER)) {
      currentScreen = GameScreen.Ending
    }
  }

  Raylib.beginDrawing()

  Raylib.clearBackground(Color.RayWhite)

  if (currentScreen == GameScreen.Logo) {
    Raylib.drawText("Logo Screen", 20, 20, 40, Color.LightGray)
    Raylib.drawText("Wait for 2 seconds...", 290, 220, 20, Color.Gray)
  }

  if (currentScreen == GameScreen.Title) {
    Raylib.drawRectangle(0, 0, screenWidth, screenHeight, Color.Green)
    Raylib.drawText("TITLE SCREEN", 20, 20, 40, Color.Blue)
    Raylib.drawText("PRESS ENTER or TAP to JUMP to GAMEPLAY SCREEN", 120, 220, 20, Color.DarkGreen)
  }

  if (currentScreen == GameScreen.GamePlay) {
    Raylib.drawText("GAMEPLAY SCREEN", 20, 20, 40, Color.Purple)
    Raylib.drawText("PRESS ENTER or TAP to JUMP to ENDING SCREEN", 130, 220, 20, Color.Maroon)
  }

  if (currentScreen == GameScreen.Ending) {
    Raylib.drawText("GAMEPLAY SCREEN", 20, 20, 40, Color.DarkBlue)
    Raylib.drawText("PRESS ENTER or TAP to RETURN to TITLE SCREEN", 130, 220, 20, Color.Maroon)
  }

  Raylib.endDrawing()
}

Raylib.closeWindow()


