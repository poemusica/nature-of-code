class Wave {
  float xSpacing, angSpacing;
  float angle, angVel;
  float amplitude, wlength;
  float r;
  PVector loc;
  float[] points;
  
  Wave(float _y) {
    // random variables
    angSpacing = floor(random(1, 11)) / 100.0; // zoom sampling selection. constrain(0.1, 0.01) 
    amplitude = random(10, 50); // height of wave. constrain(10, 100)
  
    // fixed variables
    angVel = 0.2;
    wlength = width;
    xSpacing = 5;
    angle = 0;
    r = 10 * xSpacing; // size of sample points.
    points = new float[floor(width/xSpacing) + 1];
    
    // input variables
    loc = new PVector(wlength/2, _y); // location (centered)
    
    }
  
  void addWaves(Wave w1, Wave w2) {
    fill(110, 0, 0, 90);
    pushMatrix();
    translate(0, loc.y);
    float x = 0;
    for (int i = 0; i < points.length; i++) {
      float y = w1.points[i] + w2.points[i];
      ellipse(x, y, r, r);
      x += xSpacing;
    }
    popMatrix();
  }
  
  void display() {
    fill(110, 90);
    pushMatrix();
    translate(loc.x, loc.y);
    int i = 0;
    for (float x = -wlength/2; x <= wlength/2; x += xSpacing) {
      float y = map(sin( (angSpacing * x) + angle), -1, 1, -amplitude, amplitude);
      ellipse(x, y, r, r);
      points[i] = y;
      i += 1;
    }
    popMatrix();
    angle += angVel;
  }
  
}
