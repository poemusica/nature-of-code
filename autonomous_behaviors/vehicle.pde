class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, tside, theight;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector();
    acc = new PVector();
    maxSpeed = 8;
    maxForce = 4;
    mass = 1;
    
    r = 12;
    tside = 2 * (sin(radians(60)) * r);
    theight = sin(radians(60)) * tside;
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
    seek(new PVector(mouseX, mouseY));
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display() {    
    noStroke();
    fill(175);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    // body
    ellipse(0, 0, r*2, r*2);
    // head
    translate(r/2 + theight/2, 0);
    triangle(-theight/2, -tside/2, -theight/2, tside/2, theight, 0); 
    // if we had not translated, it would be
    // triangle(r/2, -tside/2, r/2, tside/2, r/2 + theight, 0);
    // whiskers
    stroke(175);
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
    popMatrix();
  }
}
