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
    if (loc.x >= width) {
      loc.x = width;
    }
    if (loc.y >= height/2 - r) {
      loc.y = height/2 - r;
    }
    else {
      loc.add(vel);
    }
    acc.mult(0);
  }
  
  void display() {
    translate(0, height/2);
    translate(loc.x, loc.y);
    rotate(radians(incline));
    translate(0, -r);
    rect(0, 0, 2*r, 2*r);
  }
}
