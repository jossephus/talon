import "raylib" for Raylib, Rectangle, Vector2, Color

var SCREEN_WIDTH = 800
var SCREEN_HEIGHT = 900

Raylib.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Shapes")

var rotation = 0.0

while (!Raylib.windowShouldClose()) {
  rotation = rotation + 0.2

  Raylib.beginDrawing()

  Raylib.clearBackground(Color.RayWhite)

  Raylib.drawText("some basic shapes available on raylib", 20, 20, 20, Color.DarkGray)

  Raylib.endDrawing()
}

/* 


DrawText("some basic shapes available on raylib", 20, 20, 20, DARKGRAY);

            // Circle shapes and lines
            DrawCircle(screenWidth/5, 120, 35, DARKBLUE);
            DrawCircleGradient(screenWidth/5, 220, 60, GREEN, SKYBLUE);
            DrawCircleLines(screenWidth/5, 340, 80, DARKBLUE);

            // Rectangle shapes and lines
            DrawRectangle(screenWidth/4*2 - 60, 100, 120, 60, RED);
            DrawRectangleGradientH(screenWidth/4*2 - 90, 170, 180, 130, MAROON, GOLD);
            DrawRectangleLines(screenWidth/4*2 - 40, 320, 80, 60, ORANGE);  // NOTE: Uses QUADS internally, not lines

            // Triangle shapes and lines
            DrawTriangle((Vector2){ screenWidth/4.0f *3.0f, 80.0f },
                         (Vector2){ screenWidth/4.0f *3.0f - 60.0f, 150.0f },
                         (Vector2){ screenWidth/4.0f *3.0f + 60.0f, 150.0f }, VIOLET);

            DrawTriangleLines((Vector2){ screenWidth/4.0f*3.0f, 160.0f },
                              (Vector2){ screenWidth/4.0f*3.0f - 20.0f, 230.0f },
                              (Vector2){ screenWidth/4.0f*3.0f + 20.0f, 230.0f }, DARKBLUE);

            // Polygon shapes and lines
            DrawPoly((Vector2){ screenWidth/4.0f*3, 330 }, 6, 80, rotation, BROWN);
            DrawPolyLines((Vector2){ screenWidth/4.0f*3, 330 }, 6, 90, rotation, BROWN);
            DrawPolyLinesEx((Vector2){ screenWidth/4.0f*3, 330 }, 6, 85, rotation, 6, BEIGE);

            // NOTE: We draw all LINES based shapes together to optimize internal drawing,
            // this way, all LINES are rendered in a single draw pass
            DrawLine(18, 42, screenWidth - 18, 42, BLACK);
*/
