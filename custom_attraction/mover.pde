class Mover {
  PVector loc, vel, acc;
  float mass, s;
  float r, g, b, a;
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(1), random(1));
    acc = new PVector(0, 0);
    
    mass = random(10, 30);
    s = mass;
    
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = random(220, 255);
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
    noStroke();
    fill(r, g, b, a);
    ellipse(loc.x, loc.y, 2, 2);
  }
}
