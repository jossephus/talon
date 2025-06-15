import "embed" for Load

Load.foreignFunction("main.C.add(_,_)", "wren_c_embed_add")
class C {
  foreign static add(a, b)
}


System.print(C.add(3, 2))
