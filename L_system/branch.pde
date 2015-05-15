class Branch {
  PVector start, end;

  Branch(PVector s, PVector e) {
    start = s.get();
    end = e.get();
  }
  
  void display() {
    line(start.x, start.y, end.x, end.y);
  }
}
