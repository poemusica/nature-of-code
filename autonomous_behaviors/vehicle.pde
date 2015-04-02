class Vehicle {
  PVector loc, vel, acc;
  float maxSpeed, maxForce;
  float mass;
  float r, tside, theight, col;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector();
    acc = new PVector();
    maxSpeed = 4;
    maxForce = 2;
    mass = 1;
    
    r = 12;
    tside = 2 * (sin(radians(60)) * r);
    theight = sin(radians(60)) * tside;
    col = random(0, 210);
  }
  
  void pursue(Vehicle target) {
    PVector projected = PVector.add(target.loc, target.vel);
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
    wrap();
  }
  
  void wrap(){ 
    float d = 2*r;
    if (loc.x > width + d){
      loc.x = 0;
    }
    if (loc.x < -d){
      loc.x = width;
    }
    if (loc.y > height + d){
      loc.y = 0;
    }
    if (loc.y < -d){
      loc.y = height;
    } 
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
    popMatrix();
  }
}
