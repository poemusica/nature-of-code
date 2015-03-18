class Fire extends Particle {
  
  Fire(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.3 - 1.0;
    acc.set(vx, vy);
    fadeRate = 9;
    mass = 0.75;
  }
  
  void display() {
    imageMode(CENTER);
    tint(235, 35, 10, lifespan);
    image(smokeImg, loc.x, loc.y, lifespan/7, lifespan/5);
  }
  
}
