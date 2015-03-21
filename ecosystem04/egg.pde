class Egg extends Mover {
  float timer;
  
  Egg(PVector _loc) {
    super(_loc);
    float health = 1;
    timer = 500;
    float g = (int) generator.nextGaussian() * 50 + 205;
    fillcolor = new PVector(0, g, 0);
  }
  
  boolean hatched() {
    if (timer <= 0 && !isDead()) {
      health = 0;
      return true;
    }
    return false;
  }
  
  boolean laidEgg() {
    return false;
  }
  
  void hunt(Mover m) {
  }
  
  PVector attract(Mover m) {
    if (parent == m) {
      return new PVector(0, 0);
    }
    else return super.attract(m);
  }
  
  void update() {
    timer -= 1;
  }
  
  void display() {
    if (!isDead()) {
      pushMatrix();
      translate(loc.x, loc.y);
      noStroke();
      fill(fillcolor.x, fillcolor.y, fillcolor.z, 245);
      ellipse(0, 0, size/5, size/5);
      popMatrix();
    }
  }
}
