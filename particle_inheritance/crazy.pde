class Crazy extends Particle {
  float r, g, b;
  Crazy(PVector _loc) {
    super(_loc);
    r = random(0, 256);
    g = random(0, 256);
    b = random(0, 256);
  }
  
  void display() {
    imageMode(CENTER);
    tint(r, g, b, lifespan);
    image(smokeImg, loc.x, loc.y, 20, 20);
  }
  
}
