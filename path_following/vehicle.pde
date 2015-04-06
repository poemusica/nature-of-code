class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, col;
  
  PVector normPt, futLoc, pathTarget;
  boolean seeking;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(3, 0);
    acc = new PVector();
    maxSpeed = 5;
    maxForce = 2;
    mass = 1;
    
    r = 20;
    col = random(0, 210);
    
    seeking = false;
  }
  
  void followPath(Path p) {
    PVector predict = vel.get();
    predict.setMag(r);
    predict.add(loc); // set predict to vehicle's future location
    futLoc = predict.get(); // global for debug display
    
    PVector normalPt = findNormalPt(predict, p.start, p.end);
    float d = PVector.dist(predict, normalPt);
    
    predict = PVector.sub(p.end, p.start);
    predict.setMag(p.w/2);
    PVector target = PVector.add(normalPt, predict);
    pathTarget = target.get(); // global for debug display
    
    if (d > p.w/2) { // adjust of vehicle is too far from the path
      seek(target);
      // globals for debug display
      seeking = true;
    } else { seeking = false; }
    normPt = normalPt.get(); 
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
  
  void wrap(Path p) { // one-way
    if (loc.x > p.end.x + r) {
      loc.x = p.start.x - r;
      loc.y = p.start.y + (loc.y-p.end.y);
    }
  }
  
  void display() {    
    stroke(col);
    fill(col);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    // body
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    // path following guides
    popMatrix();
    stroke(0);
    fill(0);
    line(loc.x, loc.y, futLoc.x, futLoc.y);
    ellipse(futLoc.x, futLoc.y, 5, 5);
    line(futLoc.x, futLoc.y, normPt.x, normPt.y);
    ellipse(normPt.x, normPt.y, 5, 5);
    if (seeking) {
      fill(255, 0, 0);
    }
    ellipse(pathTarget.x, pathTarget.y, 5, 5);
  }
}
