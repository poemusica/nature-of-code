class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, col;
  
  PVector normPt, futLoc, pathTarget;
  boolean seeking;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector();
    maxSpeed = 5;
    maxForce = 5;
    mass = 1;
    
    r = 20;
    col = random(0, 210);
    
    seeking = false;
  }
  
  PVector getNormalPt(PVector point, PVector start, PVector end) {
    PVector hyp = PVector.sub(point, start);
    PVector proj = PVector.sub(end, start); // project hyp onto segment
    proj.normalize();
    proj.mult(hyp.dot(proj));
    PVector normalPt = PVector.add(start, proj);
    return normalPt;
  }
  
  void followPath(Path p) {
    PVector predict = vel.get();
    predict.setMag(25);
    predict.add(loc);
    PVector target = null;
    PVector norm = null;
    float d = width * 10;
    for (int i = 0; i < p.numPts; i++) {
      PVector start = p.points[i];
      PVector end = p.points[(i+1) % p.numPts]; // for wrap
      PVector lookAhead = PVector.sub(end, start); // look ahead along this segment
      PVector normCurrent = getNormalPt(predict, start, end);
      // points could be listed N-S, S-N, E-W, W-E, etc.
      // use min & max to check if normalPt is on the segment. 
      if(normCurrent.x < min(start.x, end.x) || normCurrent.x > max(start.x, end.x)
      || normCurrent.y < min(start.y, end.y) || normCurrent.y > max(start.y, end.y)) {
        normCurrent = end.get(); // nudge movement clockwise around point list
        start = end;
        end = p.points[(i+2) % p.numPts]; // for wrap
        lookAhead = PVector.sub(end, start); // look ahead along next segment
      }
      lookAhead.setMag(r);
      float dCurrent = PVector.dist(normCurrent, predict);
      if (dCurrent < d) {
        d = dCurrent;
        norm = normCurrent;
        target = norm.get();
        target.add(lookAhead); // should check whether lookAhead is on a segment?
      }
    }
    if (d > p.w/2) {
      seek(target);
      fill(255, 0, 0);
    }
    ellipse(target.x, target.y, 5, 5); // debug
    
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
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
