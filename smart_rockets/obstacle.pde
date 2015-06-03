class Obstacle {
  PVector loc;
  float w, h;
  
  Obstacle(PVector _loc, float _w, float _h) {
    loc = _loc.get();
    w = _w;
    h = _h;
  }
  
  boolean contains(PVector v) {
    if (v.x > loc.x && v.x < loc.x + w && v.y > loc.y && v.y < loc.y + h) {
      return true;
    }
    return false;
  }
  
  void display() {
    noStroke();
    rect(loc.x, loc.y, w, h);
  }
}
