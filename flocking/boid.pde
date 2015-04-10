class Boid {
  Flock myFlock;
  PVector loc, vel, acc;
  Data maxSpeed, maxForce;
  float mass, r;
  PVector col, debugCol;
  float wanderTheta; 
  float angRange, angView, dRange, dSep, dCoh, dAli;

  Boid(PVector _loc, Flock _flock) {
    myFlock = _flock;
    loc = _loc.get();
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    maxSpeed = myFlock.maxSpeed;
    maxForce = myFlock.maxForce;
    mass = 1;

    r = 12;
    float c = random(0, 210); 
    col = new PVector(c, c, c);
    debugCol = col.get();
    wanderTheta = 0;

    angRange = radians(110);
    angView = radians(45);
    dRange = sq(r)/2;
    dSep = r*2;
    dCoh = dRange*0.25;
    dAli = dRange*0.5;
  }

  void debug(ArrayList<Boid> others) {
    for (Boid other : others) {
      PVector v = PVector.sub(other.loc, loc);
      float angDiff = PVector.angleBetween(vel, v);
      float d = v.mag();
      if (d > 0 && d < dRange && angDiff < angView) { 
        other.col.set(255, 0, 0);
      } else if (d > 0 && d < dRange && angDiff < angRange) { 
        other.col.set(0, 0, 255);
      } else if (d > 0) { 
        other.col.set(debugCol);
      }
    }
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    fill(0, 0, 0, 45);
    arc(0, 0, dRange*2, dRange*2, -angRange, angRange, PIE);
    fill(0, 0, 0, 75);
    arc(0, 0, dRange*2, dRange*2, -angView, angView, PIE);
    popMatrix();
  }

  void run(ArrayList<Boid> others) {
    applyBehaviors(others);
    update();
    wrap();
    display();
  }

  void applyBehaviors(ArrayList<Boid> others) {
    // get forces
    PVector viewForce = view(others);
    PVector separateForce = separate(others);
    PVector cohereForce = cohere(others);
    PVector alignForce = align(others);
    PVector fleeForce = flee(new PVector(mouseX, mouseY));
    PVector seekForce = seek(new PVector(mouseX, mouseY));
    PVector wanderForce = wander();
    PVector edgeForce = avoidEdges();
    // adjust forces
    viewForce.mult(myFlock.view.value);
    separateForce.mult(myFlock.sep.value);
    cohereForce.mult(myFlock.coh.value);
    alignForce.mult(myFlock.ali.value);
    fleeForce.mult(myFlock.flee.value);
    seekForce.mult(myFlock.seek.value);
    wanderForce.mult(myFlock.wander.value);
    edgeForce.mult(myFlock.edge.value);
    // apply forces
    applyForce(viewForce);
    applyForce(separateForce);
    applyForce(cohereForce);
    applyForce(alignForce);
    //    applyForce(fleeForce);
    //    applyForce(seekForce);
    applyForce(wanderForce);
    //    applyForce(edgeForce);
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

  PVector view(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desiredMax = new PVector();
    //    PVector desiredAve = new PVector();
    int count = 0;
    for (Boid other : others) {
      PVector v = PVector.sub(other.loc, loc);
      float angDiff = PVector.angleBetween(vel, v);
      float d = v.mag();
      float normMax = 0;
      if (d > 0 && d < dRange && angDiff < angView) {
        PVector norm = getNormalPt(other.loc, loc, PVector.add(loc, vel));
        PVector desired = PVector.sub(norm, other.loc);
        if (desired.mag() > normMax) { 
          normMax = desired.mag(); 
          desiredMax = desired.get();
        }
        //        desired.normalize();
        //        desiredAve.add(desired);
        count++;
        //        PVector test = PVector.add(loc, desired);
        //        line(loc.x, loc.y, norm.x, norm.y);
        //        line(other.loc.x, other.loc.y, norm.x, norm.y);
        //        line(test.x, test.y, loc.x, loc.y);
      }
    }
    if (count > 0) {
      desiredMax.setMag(20);
      PVector test = PVector.add(loc, desiredMax);
      //      line(loc.x, loc.y, test.x, test.y);
      desiredMax.setMag(maxSpeed.value);
      //      desiredAve.div(count);
      //      desiredAve.setMag(maxSpeed.value);
      steer = PVector.sub(desiredMax, vel);
      //      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce.value);
    }
    return steer;
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
      desiredAve.setMag(maxSpeed.value);
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce.value);
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
      desiredAve.setMag(maxSpeed.value);
      steer = PVector.sub(desiredAve, vel);
      steer.limit(maxForce.value);
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
      desired.setMag(maxSpeed.value);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce.value);
    }
    return steer;
  }

  PVector flee(PVector threat) {
    PVector steer = new PVector();
    PVector desired = PVector.sub(loc, threat);
    float angDiff = PVector.angleBetween(vel, PVector.mult(desired, -1));
    if (desired.mag() < dRange && angDiff < angRange) {
      desired.setMag(maxSpeed.value);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce.value);
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
      desired.setMag(maxSpeed.value);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce.value);
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
    steer.limit(maxForce.value);
    return steer;
  }

  PVector avoidEdges() {
    float border = 10;
    PVector desired = vel.get();
    if (loc.x < border) {
      desired.x = maxSpeed.value;
    } else if (loc.x > width - border) {
      desired.x = -maxSpeed.value;
    }
    if (loc.y < border) {
      desired.y = maxSpeed.value;
    } else if (loc.y > height - border) { 
      desired.y = -maxSpeed.value;
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce.value);
    return steer;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed.value);
    loc.add(vel);
    acc.mult(0);
  }

  void wrap() {
    if (loc.x < -r) { 
      loc.x = width + r;
    }
    if (loc.x > width + r) { 
      loc.x = -r;
    }
    if (loc.y < -r) { 
      loc.y = height + r;
    }
    if (loc.y > height + r) { 
      loc.y = -r;
    }
  }

  void display() {
    pushStyle(); 
    stroke(col.x, col.y, col.z);
    fill(col.x, col.y, col.z);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    arc(0, 0, r*2, r*2, radians(150), radians(210), PIE);
    popMatrix();
    popStyle();
  }
}

