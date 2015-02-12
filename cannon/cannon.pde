class Cannon {
  PVector loc;
  float size;
  
  Cannon() {
    size = 100;
    loc = new PVector(50, height - 35);
  }
  
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(-30));
    ellipse(0, 0, size, size/2);
    popMatrix();
  }
}
