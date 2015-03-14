class Particle {
  PVector loc, vel, acc;
  float angle, aVel, aAcc;
  float size;
  
  Particle(PVector _loc, float _size) {
    loc = _loc.get();
    vel = PVector.random2D();
    vel.div(5);
    acc = new PVector(0, 0.1); //gravity
    size = _size;
    
    angle = 0;
    aVel = vel.x/5;
    aAcc = 0;
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    
    aVel += aAcc;
    angle += aVel;
    aAcc = 0;
  }
  
  void display() {
    stroke(130);
    fill(130);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, size, size);
    popMatrix();
  }
}
