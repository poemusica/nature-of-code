class Wave {
  float xSpacing, angSpacing;
  float angle, angVel;
  float amplitude, wlength;
  float r;
  PVector loc, vel, acc;
  
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
    
    // calculated variables
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    }
  
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    acc = PVector.sub(mouse, loc);
    acc.setMag(0.25);
    
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);
  }
  
  void display() {
    
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    fill(110, 90);
    for (float x = 0; x >= -wlength; x -= xSpacing) {
      float y = map(sin( (angSpacing * x) + angle), -1, 1, -amplitude, amplitude);
      ellipse(x, y, r, r);
//      line(x, 0, x, y);
    }
    fill(0);
    ellipse(0, map(sin((angSpacing * 0) + angle), -1, 1, -amplitude, amplitude), r, r);
    line(0, 0, -wlength, 0);
    fill(255, 0, 0);
    ellipse(0, 0, 5, 5);
    popMatrix();
    angle += angVel;
  }
  
}
