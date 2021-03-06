class Smoke extends Particle {
  
  Smoke(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.3 - 1.0;
    acc.set(vx, vy);
  }
  
  void display() {
    imageMode(CENTER);
    tint(0, 153, 204, lifespan);
    image(smokeImg, loc.x, loc.y, 20, 20);
  }
  
}
