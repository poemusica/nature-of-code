class Wave {
  float xSpacing, angSpacing;
  float angle, angVel;
  float amplitude, wlength;
  float r;
  PVector loc;
  
  Wave(float _x, float _y) {
    // input variables
    loc = new PVector(_x, _y); // location (centered)
    
    // random variables
    angSpacing = floor(random(1, 11)) / 100.0; // zoom sampling selection. constrain(0.1, 0.01) 
    angVel = floor(random(1, 41)) / 100.0; // undulation speed. constrain(0.4. 0.01)
    amplitude = random(10, 100); // height of wave. constrain(10, 100)
    wlength = random(10, 150); // length of wave. constrain(10, 150)
    xSpacing = random(2, 8); // number of points sampled. constrain(2, 8)
   
    // fixed variables
    angle = 0;
    r = 10 * xSpacing; // size of sample points.
    }
  
  void display() {
    fill(110, 90);
    pushMatrix();
    translate(loc.x, loc.y);
    for (float x = -wlength/2; x <= wlength/2; x += xSpacing) {
      float y = map(sin( (angSpacing * x) + angle), -1, 1, -amplitude, amplitude);
      ellipse(x, y, r, r);
    }
    popMatrix();
    angle += angVel;
  }
  
}
