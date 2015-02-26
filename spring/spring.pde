class Spring{ // structure this class to extend Mover?
  PVector anchor;
  float restLen, k;
  
  Spring() {
    restLen = 200;
    k = 0.01;
    anchor = new PVector(0, 0);
  }
  
  PVector springForce(Mover mover) {
    PVector f = PVector.sub(anchor, mover.loc);
    float d = f.mag() - restLen;
    float mag = d * k;
    f.setMag(mag);
    return f;
  }
  
  void connect(Mover mover) {
    line(anchor.x, anchor.y, mover.loc.x, mover.loc.y);
  }
}
