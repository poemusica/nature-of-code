class Mover {
  PVector loc, vel, acc;
  float mass, s;
  
  Mover() {
    loc = new PVector(width/2, height/2 - 25);
    vel = new PVector(0.65, 0);
    acc = new PVector(0, 0);
    
    mass = 1;
    s = 10;
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
    ellipse(loc.x, loc.y, s, s);
  }
}
