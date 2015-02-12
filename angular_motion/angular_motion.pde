class Mover {
  PVector loc, vel, acc;
  float angle, angvel, angacc;
  float size, mass;
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    
    angle = 0;
    angvel = vel.x/50;
    angacc = 0;
    
    mass = random(2, 6);
    size = mass * 10;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    checkEdges();
    acc.mult(0);
    
    angvel += angacc;
    angle += angvel;
    angacc = 0;
  }
  
  void checkEdges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    }
    if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }
    if (loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    }
    if (loc.y < 0) {
      loc.y = 0;
      vel.y *= -1; 
    }
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
