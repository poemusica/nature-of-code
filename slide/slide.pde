class Box{
  float r;
  PVector loc, vel, acc;
  
  Box() {
    r = 10;
    loc = new PVector(0, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void applyForce(PVector f) {
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    println(loc);
    acc.mult(0);
    
    if (loc.y >= width) {
      loc.y = width;
    }
  }
  
  void display() {
    translate(0, height/2 - r);
    rotate(radians(-90 + incline));
    rect(loc.x, loc.y, 2*r, 2*r);
  }
}
