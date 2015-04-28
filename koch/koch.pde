class KochLine {
  PVector start, end;
  
  KochLine(PVector a, PVector b) {
    start = a.get();
    end = b.get(); 
  }
  
  PVector kochA() {
    return start.get();
  }
  
  PVector kochB() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }
  
  PVector kochC() {
    PVector v = kochB();
    PVector u = PVector.sub(end, start);
    u.div(3);
    u.rotate(-radians(60));
    v.add(u);
    return v;
  }
  
  PVector kochD() {
    PVector v = PVector.sub(end, start);
    v.mult(2/3.0);
    v.add(start);
    return v;
  }
  
  PVector kochE() {
    return end.get();
  }
  
  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
}

class KochList {
  ArrayList<KochLine> lines;
  
  KochList(PVector start, PVector end) {
    lines = new ArrayList<KochLine>();
    lines.add(new KochLine(start, end));
  }
  
  void generate() {
    ArrayList<KochLine> next = new ArrayList<KochLine>();
    for (KochLine k : lines) {
      PVector a = k.kochA();
      PVector b = k.kochB();
      PVector c = k.kochC();
      PVector d = k.kochD();
      PVector e = k.kochE();
      next.add(new KochLine(a, b));
      next.add(new KochLine(b, c));
      next.add(new KochLine(c, d));
      next.add(new KochLine(d, e));
    }
    lines = next;
  }
  
}
