class Oscillator  {
 
  PVector loc, range;
  float angle, aVelocity;
  float arm, angR;
 
  Oscillator() {
    angR = 0;
    arm = 30;
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
    translate(loc.x, loc.y);
    rotate(angR);
    
//    fill(255);
    
    rotate(oscillate());
    ellipse(arm/2, 0, arm, 15);
    fill(200, 235, 0);
    ellipse(0, 0, 5, 5);
    
    popMatrix();
  }
}
