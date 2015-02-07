class Mover {
  PVector loc, vel, acc;
  float mass;
  
  Mover(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    mass = random(0.5, 2);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);                           
  }
  
  void display() {
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, mass * 20, mass * 20);
  }
  
  boolean isInside(Liquid l) {
    if (loc.y > l.y) {
      return true;
    }
    return false;
  }
  
  void checkEdges() {
    if (loc.x > width) {
      vel.x *= -1;
      loc.x = width;
    }
    if (loc.x < 0) {
      vel.x *= -1;
      loc.x = 0;
    }
    if (loc.y > height) {
      vel.y *= -1;
      loc.y = height;
    }
    if (loc.y < 0) {
      vel.y *= -1;
      loc.y = 0; 
    }
  }
}

