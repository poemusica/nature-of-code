class Blue extends Particle {
  
  Blue(PVector _loc) {
    super(_loc);
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.3 - 1.0;
    acc.set(vx, vy);
    fadeRate = 10;
    mass = 1;
  }
  
  void update() {
    acc.div(10);
    super.update();
  }
  
  void display() {
    imageMode(CENTER);
    tint(10, 66, 255, lifespan);
    image(blueImg, loc.x, loc.y, lifespan/8, lifespan/5);
  }
  
}
