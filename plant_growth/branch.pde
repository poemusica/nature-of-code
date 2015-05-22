class Branch {
  char c;
  PVector start, end, loc, dir;
  float theta, len;
  
  Branch(char _c, PVector s, PVector e, float t) {
    c = _c;
    start = s.get();
    end = e.get();
    theta = t;
    loc = s.get();
    dir = PVector.sub(end, start);
    dir.setMag(1);
    len = PVector.dist(start, end);
    println(len);
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
