class Oscillator  {
 
  PVector origin, loc, angles;
  PVector aVelocity;
  PVector amplitude;
  float angR;
 
  Oscillator() {
    angR = 0;
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
    float y = sin(angles.y + angR); // creates the casscade effect.
    loc.y = map(y, -1, 1, 0, amplitude.y);
 
    pushMatrix();
    translate(origin.x, origin.y);
    rotate(angR);
    stroke(0);
    fill(255);
    line(0,0,loc.x, loc.y);
    ellipse(loc.x, loc.y, 16, 16);
    popMatrix();
  }
}
