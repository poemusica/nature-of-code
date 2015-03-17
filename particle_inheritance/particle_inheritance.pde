class Particle{
  PVector loc, vel, acc;
  float angle, aVel;
  float mass, size, lifespan, fadeRate;
  
  Particle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    
    angle = 0;
    aVel = acc.x/10;
    
    mass = 1;
    size = 10;
    lifespan = 255;
    fadeRate = 4;
  }
  
  boolean isDead() {
    if (lifespan <= 0) { return true; }
    return false;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    angle += aVel;
    
    lifespan -= fadeRate;
  }
  
  void display() {
    stroke(175, lifespan);
    fill(175, lifespan);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    ellipse(0, 0, size, size);
    popMatrix();
  }
  
  void run() {
    update();
    display();
  }
}
