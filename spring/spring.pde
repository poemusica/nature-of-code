class Spring{
  PVector anchor;
  float restLen, minLen, maxLen, k;
  
  Spring(float _x, float _y) {
    restLen = 100;
    minLen = 10;
    maxLen = sqrt(sq(width) + sq(height));
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
  
  void constrainLen(Mover mover) {
    PVector dir = PVector.sub(anchor, mover.loc);
    float springLen = dir.mag();
    
    if (springLen < minLen) {
      dir.setMag(minLen);
      mover.loc = PVector.add(anchor, dir);
      mover.vel.mult(0);
    }
    if (springLen > maxLen) {
      dir.setMag(maxLen);
      mover.loc = PVector.add(anchor, dir);
      mover.vel.mult(0);
    }
  }
  
  void update(Mover mover) {
    anchor = mover.loc;
  }
  
  void connect(Mover mover) {
    PVector f = springForce(mover);
    float r = mover.r;
    mover.applyForce(f);
  }
  
  void display(Mover mover) {
    float r = mover.r;
    
    line(anchor.x, anchor.y, mover.loc.x, mover.loc.y);
  }
}
