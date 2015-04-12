class Boid {
  Flock myFlock;
  PVector loc, vel, acc;
  Data maxSpeed, maxForce; // defined by flock
  Data angRange, angView, dRange, sepRange, cohRange, aliRange; // defined by flock
  Data shape; // defined by flock
  float r, mass; // r (boid radius) defined by flock
  color c, debugC; // debug color
  float wanderTheta;

  Boid(PVector _loc, Flock _flock) {
    myFlock = _flock;
    loc = _loc.get();
    vel = new PVector(0, 0);
    acc = PVector.random2D();
    maxSpeed = myFlock.maxSpeed;
    maxForce = myFlock.maxForce;
    mass = 1;
    r = myFlock.r;
    shape = myFlock.shape; // defines boid arc
    c = myFlock.c;
    debugC = c;
    wanderTheta = 0;
    angRange = myFlock.angRange;
    angView = myFlock.angView;
    dRange = myFlock.range;
    sepRange = myFlock.sepRange;
    cohRange = myFlock.cohRange;
    aliRange = myFlock.aliRange;
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
  
  PVector view(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Boid other : others) {
      PVector toOther = PVector.sub(other.loc, loc); // adjacent
      float angDiff = PVector.angleBetween(vel, toOther); // theta
      float d = toOther.mag(); // adjacent len
      if (d > 0 && d < dRange.value && angDiff < angView.value) {
        PVector desired = vel.get(); // hypotenuse
        float scalar = d/cos(angDiff); // hypotenuse len = cos(theta)/adjacent
        desired.setMag(scalar);
        desired.sub(toOther);
        desiredAve.add(desired);
        count++;
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

  PVector separate(ArrayList<Boid> others) {
    PVector steer = new PVector();
    PVector desiredAve = new PVector();
    int count = 0;
    for (Boid other : others) {
      PVector desired = PVector.sub(loc, other.loc);
      float d = desired.mag();
      float angDiff = PVector.angleBetween(vel, PVector.mult(desired, -1));
      if (d > 0 && d < sepRange.value*r && angDiff < angRange.value) {
        desired.setMag(1/d);
        desiredAve.add(desired);
        count++;
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
      if (d < dRange.value && d > dRange.value*cohRange.value && angDiff < angRange.value) {
        desired.normalize();
        desired.div(d);
        desiredAve.add(desired);
        count++;
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
      if (d > 0 && d < dRange.value*cohRange.value && angDiff < angRange.value) {
        desired.add(other.vel);
        count++;
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
    if (desired.mag() < dRange.value && angDiff < angRange.value) {
      desired.setMag(maxSpeed.value);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce.value);
    }
    return steer;
  }

  PVector seek(PVector target) {
    PVector steer = new PVector();
    PVector desired = PVector.sub(target, loc);
    float angDiff = PVector.angleBetween(vel, desired);
    if (desired.mag() < dRange.value && angDiff < angRange.value) {
      desired.setMag(maxSpeed.value);
      steer = PVector.sub(desired, vel);
      steer.limit(maxForce.value);
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
    noStroke();
    strokeWeight(2);
    fill(c);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    arc(0, 0, r*2, r*2, PI-shape.value, PI+shape.value, PIE);
    popMatrix();
    popStyle();
  }
  
  void debug(ArrayList<Boid> others) {
    for (Boid other : others) {
      PVector v = PVector.sub(other.loc, loc);
      float angDiff = PVector.angleBetween(vel, v);
      float d = v.mag();
      if (d > 0 && d < dRange.value && angDiff < angView.value) { 
        other.c = color(255, 0, 0);
      } else if (d > 0 && d < dRange.value && angDiff < angRange.value) { 
        other.c = color(0, 0, 255);
      } else if (d > 0) { 
        other.c = debugC;
      }
    }
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    // cohesion range purple
    strokeWeight(1);
    fill(255, 0, 255, 45);
    stroke(255, 0, 255);
    arc(0, 0, dRange.value*2, dRange.value*2, -angRange.value, angRange.value, PIE);
    fill(255);
    stroke(255, 0, 255);
    arc(0, 0, cohRange.value*dRange.value*2, cohRange.value*dRange.value*2, -angRange.value, angRange.value, PIE);;
    // total range gray
    noStroke();
    fill(0, 0, 0, 45);
    arc(0, 0, dRange.value*2, dRange.value*2, -angRange.value, angRange.value, PIE);
    // view range cyan
    fill(0, 255, 255, 45);
    arc(0, 0, dRange.value*2, dRange.value*2, -angView.value, angView.value, PIE);
    // separation range green
    stroke(0, 255, 0);
    fill(0, 255, 0, 45);
    arc(0, 0, sepRange.value*r*2, sepRange.value*r*2, -angRange.value, angRange.value, PIE);
    // alignment range yellow
    stroke(255, 255, 0);
    fill(255, 255, 0, 45);
    arc(0, 0, aliRange.value*dRange.value*2, aliRange.value*dRange.value*2, -angRange.value, angRange.value, PIE);
    popMatrix();
  }
}

