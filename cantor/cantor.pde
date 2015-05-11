class CantorLine {
  PVector start, end;
  float weight, len;
  
  CantorLine(float x, float y, float _len, float _weight) {
    start = new PVector(x, y);
    len = _len;
    weight = _weight;
    end = new PVector(x + len, y);
  }
   void display() {
     stroke(0);
     strokeWeight(weight);
     line(start.x, start.y, end.x, end.y);
   }
}

class CantorList {
  ArrayList<CantorLine> currentGen; 
  ArrayList<CantorLine> lines;
  
  CantorList(CantorLine cLine, int n) {
    lines = new ArrayList<CantorLine>();
    currentGen = new ArrayList<CantorLine>();
    lines.add(cLine);
    currentGen.add(cLine);
    for (int i = 0; i < n; i++) {
      generate();
    }
  }
  
  void generate() {
    ArrayList<CantorLine> next = new ArrayList<CantorLine>();
    for (CantorLine l : currentGen) {
      if (l.len >= 1) {
        next.add(new CantorLine(l.start.x, l.start.y + 20, l.len/3, l.weight - 1.5));
        next.add(new CantorLine(l.start.x + l.len * 2/3, l.start.y + 20, l.len/3, l.weight - 1.5));
      }
    }
    for (CantorLine l : next) {
      lines.add(l);
    }
    currentGen = next;
  }
  
  void display() {
    for (CantorLine l : lines) {
      l.display();
    }
  }
}
