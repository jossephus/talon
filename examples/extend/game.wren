import "embed" for Load
var Game = "Game"

Load.foreignFunction("C.add(_,_)", "add.dll", "wren_c_embed_add")
class C {
  foreign static add(a, b)
}

