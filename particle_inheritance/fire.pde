class Fire extends Particle {
  
  Fire(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.3 - 1.0;
    acc.set(vx, vy);
    fadeRate = 7;
  }
  
  void display() {
    imageMode(CENTER);
    tint(lifespan, lifespan);
    image(emberImg, loc.x, loc.y, 50, 50);
  }
  
}
