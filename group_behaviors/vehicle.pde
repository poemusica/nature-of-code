class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass, r, col;
  float wanderMag, wanderR, wanderTheta; 
  float sep, coh;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    maxSpeed = 2;
    maxForce = 1;
    mass = 1;
    
    r = 12;
    col = random(0, 210);
    
    wanderMag = 100;
    wanderR = 25;
    wanderTheta = 0;
    
    sep = r * 2;
    coh = sq(r);
  }
  
  void cohere(ArrayList<Vehicle> others) {
    PVector desiredAve = new PVector();
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(loc, other.loc);
      if (d > coh) {
        PVector desired = PVector.sub(other.loc, loc);
        desired.normalize();
        desired.div(d);
        desiredAve.add(desired);
        count++;
      }
    }
    if (count > 0) {
      desiredAve.div(count);
      desiredAve.setMag(maxSpeed);
      PVector steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
  
  void separate(ArrayList<Vehicle> others) {
    PVector desiredAve = new PVector();
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(loc, other.loc);
      if (d > 0 && d < sep) {
        PVector desired = PVector.sub(loc, other.loc);
        desired.normalize();
        desired.div(d);
        desiredAve.add(desired);
        count++;
      }
    }
    if (count > 0) {
      desiredAve.div(count);
      desiredAve.setMag(maxSpeed);
      PVector steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }
  
  void wander() {
    wanderTheta += random(-PI/8, PI/8);
    PVector desired = new PVector(wanderMag, 0);
    desired.rotate(vel.heading());
    PVector offset = new PVector(wanderR * cos(wanderTheta), wanderR * sin(wanderTheta));
    desired.add(offset);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  // inverse of seek
  void flee(PVector threat) {
    PVector desired = PVector.sub(loc, threat);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void avoidEdges() {
    float border = 10;
    PVector desired = vel.get();
    if (loc.x < border) {
      desired.x = maxSpeed;  
    } else if (loc.x > width - border) {
      desired.x = -maxSpeed;
    }
    if (loc.y < border) {
      desired.y = maxSpeed;
    } else if (loc.y > height - border) { 
      desired.y = -maxSpeed;
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display() {    
    stroke(col);
    fill(col);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    // body
//    ellipse(0, 0, r*2, r*2);
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
