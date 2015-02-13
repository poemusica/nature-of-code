class Oscillator  {
 
  PVector loc, angles;
  PVector aVelocity;
  PVector amplitude;
  float angR;
 
  Oscillator(float _angR) {
    angR = _angR;
    loc = new PVector();
    angles = new PVector();
    aVelocity = new PVector(0, 0.05);
    amplitude = new PVector(width/2, height/2);
  }
  
  void oscillate() {
    angles.add(aVelocity);
  }
 
  void display()  {
    float x = sin(angles.x); // currently, this is zero.
    float y = sin(angles.y + angR);
    loc.x = map(x, -1, 1, -amplitude.x, amplitude.x); // currently, this is zero.
    loc.y = map(y, -1, 1, 16, amplitude.y - 16);
 
    pushMatrix();
    translate(width/2,height/2);
    rotate(angR);
    stroke(0);
    fill(255 % (angR * 65) );

    line(0,0,loc.x, loc.y);
    ellipse(loc.x, loc.y, 16, 16);
    popMatrix();
  }
}
