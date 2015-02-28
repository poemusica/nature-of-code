class Oscillator  {
 
  PVector origin, loc, angles;
  PVector aVelocity;
  PVector amplitude;
  float arm, angR;
 
  Oscillator() {
    angR = 0;
    arm = 50;
    origin = new PVector();
    loc = new PVector();
    angles = new PVector();
    aVelocity = new PVector(0, 0.05);
    amplitude = new PVector(50, 50);
  }
  
  void oscillate() {
    angles.add(aVelocity);
  }
 
  void display()  {
    float x = cos(angles.y);
    float y = sin(angles.y);
    y = map(y, -1, 1, 1, 1);
    x = map(x, -1, 1, -1, 1);
    loc.set(x, y);
//    float y = sin(angles.y + angR); // creates the casscade effect.
//    loc.y = map(loc.x, -1, 1, 0, amplitude.x);
    loc.y *= arm;
    loc.x *= arm;
 
    pushMatrix();
    translate(origin.x, origin.y);
    rotate(angR);
    stroke(0);
    fill(255);
//    line(0, 0, 0, 50);
//    ellipse(0, 50, 16, 16);
    line(0,0,loc.x, loc.y);
    ellipse(loc.x, loc.y, 16, 16);
    popMatrix();
  }
}
