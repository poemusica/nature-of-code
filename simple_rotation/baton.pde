class Baton{
  float len, d, c;
  
  Baton() {
    len = height * 2/3;
    d = 15;
    c = 0;
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(150);

    translate(width/2, height/2);
    rotate(radians(c % 360));
    line(0, len/2, 0, -len/2);
    ellipse(0, len/2, d, d);
    ellipse(0, -len/2, d, d);

    c += 2;
  }
}
