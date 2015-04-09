class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass, r, col;
  float wanderMag, wanderR, wanderTheta; 
  float dSep, dCoh;
  float scaleSep, scaleCoh, scaleFlee, scaleSeek, scaleWander, scaleEdge;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector(0, 0);
    maxSpeed = 3;
    maxForce = 1;
    mass = 1;
    
    r = 12;
    col = random(0, 210);
    
    wanderTheta = 0;
    
    dSep = r*2;
    dCoh = sq(r);
    
    scaleSep = 0.75;
    scaleCoh = 0.5;
    scaleFlee = 0.5;
    scaleSeek = 0.5;
    scaleWander = 1.5;
    scaleEdge = 2;
  }
  
  void applyBehaviors(ArrayList<Vehicle> others) {
    // modify scalars
//    scaleSep = constrain(scaleSep + map(2*sin(loc.y), -2, 2, -0.1, 0.1), 0, 2);
//    scaleCoh = constrain(scaleCoh + map(2*cos(loc.x), -2, 2, -0.1, 0.1), 0, 2);
//    scaleWander = constrain(scaleWander + map(2*tan(loc.x), -2, 2, -0.1, 0.1), 0, 2);
//    println("sep:", scaleSep, "| coh:", scaleCoh,"| wand:",scaleWander);
    // get forces
    PVector separateForce = separate(others);
    PVector cohereForce = cohere(others);
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
//    applyForce(fleeForce);
//    applyForce(seekForce);
    applyForce(wanderForce);
    applyForce(edgeForce);
  }
  
  PVector separate(ArrayList<Vehicle> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(loc, other.loc);
      if (d > 0 && d < dSep) {
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
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector cohere(ArrayList<Vehicle> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(loc, other.loc);
      if (d > dCoh) {
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
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector flee(PVector threat) {
    PVector desired = PVector.sub(loc, threat);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    return steer;
  }
  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);
    desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
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
  
  void display() {    
    stroke(col);
    fill(col);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
//    ellipse(0, 0, r, r);
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
