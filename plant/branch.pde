class Branch {
  char c;
  PVector start, end;
  float theta;
  
  Branch(char _c, PVector s, PVector e, float t) {
    c = _c;
    start = s.get();
    end = e.get();
    theta = t;
  }
  
  void display() {
    line(start.x, start.y, end.x, end.y);
  }
}
