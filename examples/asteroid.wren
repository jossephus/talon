import "builtin" for Build

var i = 0

while (true && !Build.shouldStop()) {
  System.print("Hello World 12")
}