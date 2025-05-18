

class Raylib {
  foreign static initWindow(width, height, title)
  foreign static setTargetFPS(fps)
  foreign static windowShouldClose()
  foreign static beginDrawing()
  foreign static clearBackground()
  foreign static drawText(text, x, y, z)
  foreign static endDrawing()
  foreign static closeWindow()
}


foreign class File {
  construct create(path) {}

  foreign write(text)
  foreign close()
}
