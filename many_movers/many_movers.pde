class Mover {
  PVector loc, vel, acc;
  float mass;
  
  Mover() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    mass = 1.0;
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
  
  void checkEdges() {
    if (loc.x > width) {
      loc.x = width;
    }
    if (loc.x < 0) {
      loc.x = 0;
    }
    if (loc.y > height) {
      loc.y = height;
    }
    if (loc.y < 0) {
      loc.y = 0; 
    }
  }
}

