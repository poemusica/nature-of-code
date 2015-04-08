class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, col;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
    acc = new PVector();
    maxSpeed = 3;
    maxForce = 2;
    mass = 1;
    r = 20;
    col = random(0, 210);
  }
  
  PVector getNormalPt(PVector point, PVector start, PVector end) {
    // calculate the point that is perpendicular to the line along start-end
    // and crosses through point.
    PVector hyp = PVector.sub(point, start);
    PVector proj = PVector.sub(end, start); // project hyp onto segment
    proj.normalize();
    proj.mult(hyp.dot(proj));
    PVector normalPt = PVector.add(start, proj);
    return normalPt;
  }
  
  boolean isOnSegment(PVector point, PVector start, PVector end) {
    // assuming 3 points on the same line, check if point is on the segment start-end.
    if (point.x < min(start.x, end.x) || point.x > max(start.x, end.x)
    || point.y < min(start.y, end.y) || point.y > max(start.y, end.y)) {
      return false;
    }
    return true;
  }
  
  void followPath(Path p) {
    PVector predict = vel.get();
    predict.setMag(r);
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
      if(!isOnSegment(normCurrent, start, end)) {
        normCurrent = end.get(); // nudge movement clockwise around point list
        start = end;
        end = p.points[(i+2) % p.numPts]; // for wrap
        lookAhead = PVector.sub(end, start); // look ahead along next segment
      }
      lookAhead.setMag(p.w/2);
      float dCurrent = PVector.dist(normCurrent, predict);
      if (dCurrent < d) {
        d = dCurrent;
        norm = normCurrent;
        target = norm.get();
        target.add(lookAhead);
      }  
      float dTargEnd = PVector.dist(target, end);
      if (dTargEnd < lookAhead.mag()) {
       target = end.get(); // if target is not on the current segment, reset target to segment end point
      }
    }
    fill(0); // debug
    ellipse(norm.x, norm.y, 5, 5); // debug
    if (d > p.w/4) {
      seek(target);
      fill(255, 0, 0); // debug
    }
    ellipse(target.x, target.y, 5, 5); // debug
    line(loc.x, loc.y, target.x, target.y); // debug  
  }
  
  void separate(ArrayList<Vehicle> others) {
    PVector desiredAve = new PVector();
    int count = 0;
    for (Vehicle other : others) {
      float d = PVector.dist(loc, other.loc);
      if (d > 0 && d < r*2) {
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
    ellipse(0, 0, r*2, r*2);
//    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
