import "raylib" for Raylib, Rectangle, Vector2, Color

var PARTICLE_AY = 2400.0
var PARTICLE_AX = 200.0
var PARTICLE_VY=  -600.0
var PARTICLE_VX = 1200.0
var PARTICLE_W  = 4.0
var PARTICLE_H  = 4.0
var PARTICLE_TTL = 60.0


class Particle {
  construct new(x, y, vx, vy, ax) {
    _vel = Vector2.new(vx, vy)
    _acc = Vector2.new(ax, PARTICLE_AY)
    _rec = Rectangle.new(x, y, PARTICLE_W, PARTICLE_H)
    _ttl = PARTICLE_TTL
  }

}

class Particles {
  construct new() {}
}
