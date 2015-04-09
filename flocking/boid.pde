class Boid {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass, r, col;
  float wanderTheta; 
  float angRange, dRange, dSep, dCoh, dAli;
  float scaleSep, scaleCoh, scaleAli, scaleFlee, scaleSeek, scaleWander, scaleEdge;
  
  Boid(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    maxSpeed = 3;
    maxForce = 1;
    mass = 1;
    
    r = 12;
    col = random(0, 210);
    
    wanderTheta = 0;
    
    angRange = radians(110);
    dRange = sq(r)/2;
    dSep = r*2;
    dCoh = dRange*0.25;
    dAli = dRange*0.5;
    
    scaleSep = 0.7;
    scaleCoh = 0.3;
    scaleAli = 0.5;
    scaleFlee = 0.75;
    scaleSeek = 0.8;
    scaleWander = 0.9;
    scaleEdge = 2;
  }
  
  void applyBehaviors(ArrayList<Boid> others) {
    // get forces
    PVector separateForce = separate(others);
    PVector cohereForce = cohere(others);
    PVector alignForce = align(others);
    PVector fleeForce = flee(new PVector(mouseX, mouseY));
    PVector seekForce = seek(new PVector(mouseX, mouseY));
    PVector wanderForce = wander();
    PVector edgeForce = avoidEdges();
    // adjust forces
    separateForce.mult(scaleSep);
    cohereForce.mult(scaleCoh);
    fleeForce.mult(scaleFlee);
    seekForce.mult(scaleSeek);
    wanderForce.mult(scaleWander);
    edgeForce.mult(scaleEdge);
    // apply forces
    applyForce(separateForce);
    applyForce(cohereForce);
    applyForce(alignForce);
//    applyForce(fleeForce);
//    applyForce(seekForce);
    applyForce(wanderForce);
//    applyForce(edgeForce);
  }
  
  PVector separate(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Boid other : others) {
      PVector desired = PVector.sub(loc, other.loc);
      float d = desired.mag();
      float angDiff = PVector.angleBetween(vel, PVector.mult(desired, -1));
      if (d > 0 && d < dSep && angDiff < angRange) {
        desired.setMag(1/d);
        desiredAve.add(desired);
        count++;
        // debug
//        stroke(255, 0, 0, 75);
//        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
    if (count > 0) {
      desiredAve.div(count);
      desiredAve.setMag(maxSpeed);
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector cohere(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Boid other : others) {
      PVector desired = PVector.sub(other.loc, loc);
      float d = desired.mag();
      float angDiff = PVector.angleBetween(vel, desired);
      if (d < dRange && d > dCoh && angDiff < angRange) {
        desired.normalize();
        desired.div(d);
        desiredAve.add(desired);
        count++;
        // debug
//        stroke(0, 255, 0, 75);
//        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
    if (count > 0) {
      desiredAve.div(count);
      desiredAve.setMag(maxSpeed);
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector align(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desired = new PVector();
    int count = 0;
    for (Boid other : others) {
      float d = PVector.dist(other.loc, loc);
      float angDiff = PVector.angleBetween(vel, PVector.sub(other.loc, loc));
      if (d > 0 && d < dAli && angDiff < angRange) {
        desired.add(other.vel);
        count++;
        // debug
//        stroke(0, 0, 255, 75);
//        line(loc.x, loc.y, other.loc.x, other.loc.y);
      }
    }
    if (count > 0) {
      desired.div(count);
      desired.setMag(maxSpeed);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector flee(PVector threat) {
    PVector steer = new PVector();
    PVector desired = PVector.sub(loc, threat);
    float angDiff = PVector.angleBetween(vel, PVector.mult(desired, -1));
    if (desired.mag() < dRange && angDiff < angRange) {
      desired.setMag(maxSpeed);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      // debug
//      stroke(0, 255, 255);
//      line(loc.x, loc.y, threat.x, threat.y);
    }
    return steer;
  }
  
  PVector seek(PVector target) {
    PVector steer = new PVector();
    PVector desired = PVector.sub(target, loc);
    float angDiff = PVector.angleBetween(vel, desired);
    if (desired.mag() < dRange && angDiff < angRange) {
      desired.setMag(maxSpeed);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce);
      // debug
//      stroke(0, 255, 255);
//      line(loc.x, loc.y, target.x, target.y);
    }
    return steer;
  }
  
  PVector wander() {
    wanderTheta += random(-PI/8, PI/8);
    PVector desired = new PVector(100, 0);
    desired.rotate(vel.heading());
    PVector offset = new PVector(25 * cos(wanderTheta), 25 * sin(wanderTheta));
    desired.add(offset);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return steer;
  }
  
  PVector avoidEdges() {
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
    return steer;
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
  
  void wrap() {
    if (loc.x < -r) { loc.x = width + r; }
    if (loc.x > width + r) { loc.x = -r; }
    if (loc.y < -r) { loc.y = height + r; }
    if (loc.y > height + r) { loc.y = -r; }
  }
  
  void display() {    
    stroke(col);
    fill(col);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    stroke(col, 75);
    fill(col, 75);
//    arc(0, 0, dRange*2, dRange*2, -angRange, angRange, PIE);
    fill(col);
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
