class Particle{
  PVector origin;
  float refAng;
  PVector loc, vel, acc;
  float angle, aVel, aAcc;
  float mass, lifespan;
  
  Particle(PVector _loc, PVector _acc, PVector _origin, float _refAng) {
    origin = _origin.get();
    refAng = _refAng;
    
    loc = _loc.get();
    vel = PVector.random2D();
    vel.div(10);
    acc = _acc.get();
    acc.mult(-0.1);
    
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
  
  // not used
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {    
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    aVel += aAcc;
    angle += aVel;
    aAcc = 0;
    
    lifespan -= 1;
  }
  
  void display() {
    pushStyle();
    stroke(175, lifespan);
    fill(175, lifespan);
    pushMatrix();
    translate(origin.x, origin.y);
    rotate(refAng);
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, 5, 5);
    popMatrix();
    popStyle();
  }
  
  void run() {
    update();
    display();
  }
}
