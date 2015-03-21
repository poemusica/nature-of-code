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
  
  boolean laidEgg() { // eggs don't lay eggs
    return false;
  }
  
  void hunt(Mover m) { // eggs don't hunt
  }
  
  void update() {
    timer -= 1; // counting down to hatch time!
  }
  
  void display() {
    if (!isDead()) {
      pushMatrix();
      translate(loc.x, loc.y);
      noStroke();
      fill(id.x, id.y, id.z, 245);
//      fill(fillcolor.x, fillcolor.y, fillcolor.z, 245);
      ellipse(0, 0, size, size);
      popMatrix();
    }
  }
}
