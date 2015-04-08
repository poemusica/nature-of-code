class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, col;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(5, 0);
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
    if(point.x < min(start.x, end.x) || point.x > max(start.x, end.x)
    || point.y < min(start.y, end.y) || point.y > max(start.y, end.y)) {
      return false;
    }
    return true;
  }
  
  PVector getLookAhead(PVector start, PVector end, float mag) {
    PVector lookAhead = PVector.sub(end, start);
    lookAhead.setMag(mag);
    return lookAhead;
  }
  
  void followPath(Path p) {
    PVector predict = vel.get();
    predict.setMag(r);
    predict.add(loc);
    PVector norm = null;
    int startIndex = p.numPts;
    float d = width * 10;
    for (int i = 0; i < p.numPts - 1; i++) {
      PVector start = p.points[i];
      PVector end = p.points[i+1];
      PVector normCurrent = getNormalPt(predict, start, end);
      if (!isOnSegment(normCurrent, start, end)) {
        normCurrent = end.get();
      }
      float dCurrent = PVector.dist(normCurrent, predict);
      if (dCurrent < d) {
        d = dCurrent;
        norm = normCurrent;
        startIndex = i;
      }
    }
    PVector segStart = p.points[startIndex];
    PVector segEnd = p.points[startIndex + 1];
    PVector lookAhead = getLookAhead(segStart, segEnd, r*2);
    // make sure that target will be on a segment
    PVector lookCheck = PVector.add(norm, lookAhead);
    if (!segEnd.equals(p.getLast()) && !isOnSegment(lookCheck, segStart, segEnd)) {
      segStart = segEnd;
      segEnd = p.points[startIndex + 2];
      lookAhead = getLookAhead(segStart, segEnd, r*2);
    }
    PVector target = PVector.add(norm, lookAhead);
    if (d > p.w/4) {
      seek(target);
      fill(255, 0, 0); // debug
    } else { fill(0); } // debug
    
    // debug
    ellipse(target.x, target.y, 5, 5);
    fill(0);
    ellipse(norm.x, norm.y, 5, 5);
    stroke(255, 0, 0);
    line(loc.x, loc.y, target.x, target.y);
    stroke(0);
    ellipse(predict.x, predict.y, 5, 5);
    line(loc.x, loc.y, predict.x, predict.y);
    line(predict.x, predict.y, norm.x, norm.y);
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
  
  boolean lapComplete(Path p) {
    if (loc.x >= p.getLast().x) {
      return true;
    } return false;
  }
  
  void wrapAround(Path p) { // one-way
      loc.x = p.getFirst().x;
      loc.y = p.getFirst().y;
  }
  
  void display() {    
    stroke(col);
    fill(col);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
  }
}
