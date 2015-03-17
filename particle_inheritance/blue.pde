class Blue extends Particle {
  
  Blue(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.3 - 1.0;
    acc.set(vx, vy);
    fadeRate = 9;
    mass = 0.5;
  }
  
  void display() {
    imageMode(CENTER);
//    tint(10, 66, 255, lifespan);
    tint(10, 66, 255, lifespan);
    image(blueImg, loc.x, loc.y, lifespan/5, lifespan/5);
  }
  
}
