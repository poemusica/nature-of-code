class Oscillator  {
 
  PVector loc, angles;
  PVector aVelocity;
  PVector amplitude;
 
  Oscillator(float vx, float vy)  {
    loc = new PVector();
    angles = new PVector();
    aVelocity = new PVector(vx, vy);
    println(aVelocity);
//    aVelocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(width/2, height/2);
  }
 
  void oscillate()  {
    angles.add(aVelocity);
  }
 
  void display()  {

    loc.x = sin(angles.x)*amplitude.x;
    loc.y = sin(angles.y)*amplitude.y;
 
    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(175);

    line(0,0,loc.x, loc.y);
    ellipse(loc.x, loc.y, 16, 16);
    popMatrix();
  }
}
