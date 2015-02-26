class Spring{ // structure this class to extend Mover?
  PVector anchor;
  float restLen, k;
  
  Spring(float _x, float _y) {
    restLen = 100;
    k = 0.01;
    anchor = new PVector(_x, _y);
  }
  
  PVector springForce(Mover mover) {
    PVector f = PVector.sub(anchor, mover.loc);
    float d = f.mag() - restLen;
    float mag = d * k;
    f.setMag(mag);
    return f;
  }
  
  void update(Mover mover) {
    anchor = mover.loc;
  }
  
  void connect(Mover mover) {
    PVector f = springForce(mover);
    mover.applyForce(f);
    line(anchor.x, anchor.y, mover.loc.x, mover.loc.y);
  }
}
