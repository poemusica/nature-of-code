class Particle{
  PVector loc, vel, acc;
  float angle, aVel, aAcc;
  float mass, lifespan;
  
  Particle() {
    loc = new PVector(random(width), height/4);
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    
    angle = 0;
    aVel = 0.1;
    aAcc = 0;
    
    mass = 1;
    lifespan = 255;
  }
  
  void reset() {
    loc = new PVector(random(width), height/4);
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    
    angle = 0;
    aVel = 0.1;
    aAcc = 0;
    
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
    if (isDead() == true) {
      reset();
    }
    
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
