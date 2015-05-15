class Branch {
  PVector start, end;
  float theta, len;

  Branch(PVector s, PVector e) {
//    theta = PVector.angleBetween(s, new PVector());
//    theta += t;
    start = s.get();
    end = e.get();  
    len = PVector.dist(start, end);
  }
  
  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
}
