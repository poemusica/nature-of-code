class Spaceship {
  PVector loc, vel, acc;
  float ang, mass, size;
  boolean thrusting; 
  
  Spaceship() {
//    loc = new PVector(random(width), random(height));
    loc = new PVector(width/2, height/2);
    ang = random(TWO_PI);
    vel = new PVector(0, 0);
    vel.mult(0);
    acc = new PVector(0, 0);
    mass = 40;
    size = mass;
    thrusting = false;
  }
  
  void thrust() {
    PVector f = new PVector(20, 0);
    f.rotate(ang);
    applyForce(f);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(10);
    if (vel.mag() < 0.01) { vel.setMag(0); }
    loc.add(vel);
    checkEdges();
    acc.mult(0);
  }
  
  void display() {
    fill(175);
    strokeWeight(2);
    translate(loc.x, loc.y);
    rotate(ang);
    pushStyle();
    if (thrusting == true) {
      fill(200, 0, 0);
    }
    rect(0, size/4, size/4, size/4);
    rect(0, -size/4, size/4, size/4);
    popStyle();
    
    triangle(0, size/2, size, 0, 0, -size/2);
  }
  
  void checkEdges() {
    if (loc.x < -size) {
      loc.x = width;
    }
    if (loc.x > width + size) {
      loc.x = 0;
    }
    if (loc.y < -size) {
      loc.y = height;
    }
    if (loc.y > height + size) {
      loc.y = 0;
    }
  }
}
