class Ember extends Particle {
  
  Ember(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.1;
    float vy = (float) generator.nextGaussian() * 0.5 - 1.0;
    acc.set(vx, vy);
    fadeRate = 8.5;
  }
  
  void display() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(emberImg, loc.x, loc.y, 50, 50);
  }
  
}
