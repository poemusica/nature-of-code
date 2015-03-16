class Confetti extends Particle {
  
  Confetti(PVector _loc) {
    super(_loc);
  }
  
  void display() {
    stroke(145, 15, 154, lifespan);
    fill(145, 15, 154, lifespan);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(angle);
    rect(0, 0, size, size);
    popMatrix();
  }
}
