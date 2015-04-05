class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, tside, theight, col;
  
  float wanderMag, wanderR, wanderTheta; 
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector();
    maxSpeed = 2;
    maxForce = 1;
    mass = 1;
    
    r = 12;
    tside = 2 * (sin(radians(60)) * r);
    theight = sin(radians(60)) * tside;
    col = random(0, 210);
    
    wanderMag = 100;
    wanderR = 25;
    wanderTheta = 0;
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
    ellipse(0, 0, r*2, r*2);
//    // head
    translate(r/2 + theight/2, 0);
    triangle(-theight/2, -tside/2, -theight/2, tside/2, theight, 0); 
    // if we had not translated, it would be
    // triangle(r/2, -tside/2, r/2, tside/2, r/2 + theight, 0);
    // whiskers
    translate(theight, 0);
    float rot = 30;
    for (int i = 0; i < 6; i++) {
      pushMatrix();
      rot += 30;
      if (i % 2 == 0) { rotate(radians(-rot)); }
      else { rotate(radians(rot)); }
      line(0, 0, r/2, 0);
      if (rot >= 120) { rot = 30; }
      popMatrix();
    }
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
