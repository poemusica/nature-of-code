class Mover{
  PVector loc, vel, acc;
  float r;
  
  Mover() {
    r = 25;
    loc = new PVector(random(-width/2, width/2), random(0, height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, 1); // div by mass here
    acc.add(f);
  }
  
  void update() {
    applyForce(gravity);
    if (mousePressed) {
      PVector wind = new PVector(map(noise(mouseX/100), 0, 1, -0.05, 0.05), map(noise(mouseY/100), 0, 1, -0.05, 0.05));
      applyForce(wind);
    }
    vel.add(acc);
    vel.mult(0.99); // dampening;
    loc.add(vel);
    acc.mult(0);
  }
  
  void display() {
    ellipse(loc.x, loc.y, r, r);
  }
}
