class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, col;
  
  float wanderMag, wanderR, wanderTheta; 
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector();
    maxSpeed = 2;
    maxForce = 1;
    mass = 1;
    
    r = 45;
    col = random(0, 210);
    
    wanderMag = 100;
    wanderR = 25;
    wanderTheta = 0;
  }
  
  void followPath(Path p) {
    PVector predict = vel.get();
    predict.setMag(25);
    PVector predictLoc = PVector.add(loc, predict);
    
  }
  
  void orbit(PVector target) {
    PVector desired = PVector.sub(target, loc);
    float dist = desired.mag();
    if (dist <= 200) {
      desired.rotate(map(dist, 0, 200, radians(180), 0));
      // alternate formula
//      dist = 100;
//      float theta = acos(maxSpeed/dist);
//      theta = PI - (theta + (PI/2));
//      desired.rotate(theta);
      desired.setMag(maxSpeed);
      PVector steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      applyForce(steer);
    } else {
      seek(target);
    }
  }
  
  void avoidEdges() {
    float border = 50;
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
  
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, loc);
    // go toward target at max speed, until you get close. then adjust speed.
    if (desired.mag() <= 100) {
      desired.setMag(map(desired.mag(), 0, 100, 0, maxSpeed));
    } else { desired.setMag(maxSpeed); }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void pursue(PVector tloc, PVector tvel) {
    PVector projected = PVector.add(tloc, tvel);
    PVector desired = PVector.sub(projected, loc);
    desired.setMag(maxSpeed);
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
    arc(0, 0, r, r, radians(150), radians(210), PIE);
    // wander guides
    line(0, 0, wanderMag, 0);
    noFill();
    pushMatrix();
    translate(wanderMag, 0);
    ellipse(0, 0, wanderR * 2, wanderR * 2);
    line(0, 0, wanderR * cos(wanderTheta), wanderR * sin(wanderTheta));
    popMatrix();
    popMatrix();
  }
}
