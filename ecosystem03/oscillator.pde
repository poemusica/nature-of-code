class Oscillator  {
 
  PVector origin, loc, range;
  float angle, aVelocity;
  float arm, angR;
 
  Oscillator() {
    angR = 0;
    arm = 50;
    origin = new PVector();
    loc = new PVector();
    range = new PVector();
    angle = 0;
    aVelocity = 0;
  }
  
  float oscillate() {
    angle += aVelocity;
    float a = map(sin(angle), -1, 1, range.x, range.y);
    return a;
  }
 
  void display()  {
    pushMatrix();
    translate(origin.x, origin.y);
    rotate(angR);
    
    stroke(0);
    fill(255);
    
    rotate(oscillate());
    loc.set(0, arm/2);
    ellipse(loc.x, loc.y, 16, arm);
    
    popMatrix();
  }
}
