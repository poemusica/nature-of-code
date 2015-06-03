class Obstacle {
  PVector loc;
  float r;
  
  Obstacle(PVector _loc, float _r) {
    loc = _loc.get();
    r = _r;
  }
  
  boolean contains(PVector v) {
    if (PVector.dist(loc, v) <= r) {
      return true;
    }
    return false;
  }
  
  void display() {
    noStroke();
    ellipse(loc.x, loc.y, 2*r, 2*r);
  }
}
