class Branch {
  char c;
  PVector start, end, loc, dir;
  int gen;
  float theta, len;
  
  Branch(char _c, int _gen, PVector s, PVector e, float t) {
    c = _c;
    gen = _gen;
    start = s.get();
    end = e.get();
    theta = t;
    loc = s.get();
    dir = PVector.sub(end, start);
    dir.setMag(0.1);
    len = PVector.dist(start, end);
  }
  
  float getCurrentLen() {
    return PVector.dist(start, loc);
  }
  
  void grow() {
    float d = PVector.dist(start, loc);
    if (d < len) {
      PVector newLoc = PVector.add(dir, loc);
      if (PVector.dist(start, newLoc) <= len) {
        loc = newLoc;
      } else {
        loc = end.get();
      }
    }
  }
  
  void display() {
    line(start.x, start.y, loc.x, loc.y);
//    line(start.x, start.y, end.x, end.y);
  }
}
