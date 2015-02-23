class Oscillator {
  PVector loc, angles, aVelocity;
  float offset;
  
  Oscillator(float _offset) {
    loc = new PVector(0, 0);
    angles = new PVector(_offset, 0);
    aVelocity= new PVector(0.025, 0);
  }
  
  void oscillate() {
    angles.add(aVelocity);
  }
  
  void display() {
    float  y = sin(angles.x);
    float x = (50 * angles.x) % width;
    y = map(y, -1, 1, -height/2, height/2);
    x = map(x, 0, width, -width/2, width/2);
    pushMatrix();
    translate(width/2, height/2);
    fill(175, 210);
    ellipse(x, y, 50, 50);
    popMatrix();
  }
}
