class Triangle extends Particle {

  Triangle (PVector _loc) {
    super(_loc);
    size = 15;
    acc.mult(2);
    mass = 2;
    fadeRate = 3;
    aVel = acc.x/50;
  }
  
  void update() {
    PVector g = new PVector(map(loc.x, 0, width, -0.2, 0.2), map(loc.y, 0, height, -0.2, 0.2));
    applyForce(g); // alternate force applied instead of default (gravity).
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
    
    angle += aVel;
    
    lifespan -= fadeRate;
  }

  void display() {
    stroke(15, 145, 154, lifespan);
    fill(15, 145, 154, lifespan);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    triangle( (cos(60) * size)/2, 0, -(cos(60) * size)/2, size/2, -(cos(60) * size)/2, -size/2);
    popMatrix();
  }
}

