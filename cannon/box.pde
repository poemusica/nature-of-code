class Box {
  PVector loc, vel, acc;
  float angle, angvel, angacc;
  float size, mass;
  
  Box() {
    loc = new PVector(-1, 0);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    
    angle = 0;
    angvel = 0;
    angacc = 0;
    
    mass = 2.5;
    size = mass * 10;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void applyRotation(float a) {
    angacc += a;  
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    angvel += angacc;
    angle += angvel;
    angacc = 0;
  }
  
  boolean onScreen(){
    if (loc.x < 0 || loc.x > width) {
      return false;
    }
    if (loc.y < 0 || loc.y > height) {
      return false;
    }
    return true;
  }
  
  void display() {
    noStroke();
    fill(175);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, size, size);
    popMatrix(); 
  }
}
