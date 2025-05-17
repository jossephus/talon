import "random" for Random
import "io" for  Directory
var random = Random.new(12345)
System.print(random.float())

class FFI {
    foreign static count()
    foreign static plusone(x)
}

var x = -8
var count = FFI.count()

while (x < count) {
    x = FFI.plusone(x)
    System.print(x)
}

System.print(count)

System.print("From Delete")
System.print(Directory.delete())
Directory.create()
