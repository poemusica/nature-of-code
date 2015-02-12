class Bob {
  PVector loc;
  float period, y;
  
  Bob() {
    loc = new PVector(width/2, 0);
    period = 150;
  }
  
  void update() {
    y = sin(TWO_PI * frameCount / period);
    y = map(y, -1, 1, 10, height/2 + 10); // amplitude
  }
  
  void display() {
    fill(200, 0, 0);
    translate(loc.x, loc.y);
    line(0, 0, 0, y);
    ellipse(0, y, 15, 15);
  }
}
