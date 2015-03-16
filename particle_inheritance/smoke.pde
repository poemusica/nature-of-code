class Smoke extends Particle {
  
  Smoke(PVector _loc) {
    super(_loc);
  }
  
  void display() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, loc.x, loc.y, 20, 20);
  }
  
}
