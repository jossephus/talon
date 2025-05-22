import "raylib" for Color, Raylib, Rectangle, Vector2, Camera2D, KeyCode, Texture2D

var width = 800
var height = 450
var title = "Sample"

Raylib.initWindow(width, height, title)
Raylib.setTargetFPS(60)

System.print(Raylib.windowShouldClose())

var target = Raylib.loadRenderTexture(width, height)
System.print(target.texture)

var camera = Camera2D.new(
   Vector2.new(2.0, 0.0), 
   Vector2.new(0.0, 0.0), 
   0.0, 
   1.0
)

while (!Raylib.windowShouldClose()) {
  Raylib.beginDrawing()

  Raylib.clearBackground(Color.Red)

  Raylib.drawText("Congrats! You created your first window!", 190, 200, 20, Color.Green)

  Raylib.getScreenWidth()
  Raylib.getScreenHeight()

  if (Raylib.isKeyDown(KeyCode.KEY_SPACE)) {
  }

  Raylib.drawTexturePro(
            target.texture,
            Rectangle.new(0.0,0.0,target.texture.width, target.texture.height),
            Rectangle.new( 0.0, 0.0, target.texture.width, target.texture.height),
            Vector2.new(0.0, 0.0),
            0.0,
            Color.new(255, 255, 255, 255 )
  )



  Raylib.endDrawing()
}

Raylib.closeWindow()



System.print(Color.Gray)

Raylib.clearBackground(Color.Gray)
Raylib.unloadRenderTexture(target)

