class Particle{
  PVector loc, vel, acc;
  float angle, aVel, aAcc;
  float mass, lifespan;
  
  Particle(PVector l) {
    loc = l.get();
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    
    angle = 0;
    aVel = acc.x/10;
    aAcc = 0;
    
    mass = 1;
    lifespan = 255;
  }
  
  boolean isDead() {
    if (lifespan <= 0.0) { return true; }
    else { return false; }
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {    
    applyForce(gravity);
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    aVel += aAcc;
    angle += aVel;
    aAcc = 0;
    
    lifespan -= 4;
  }
  
  void display() {
    stroke(175, lifespan);
    fill(175, lifespan);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, 10, 10);
    popMatrix();
  }
  
  void run() {
    update();
    display();
  }
}
