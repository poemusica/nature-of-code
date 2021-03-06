class LSystem {
  float len, theta;
  int growGen;
  ArrayList<Branch> branches;
  String sentence;
  
  LSystem(float _len, float _theta, String s) {
    len = _len;
    theta = _theta;
    growGen = 0;
    sentence = s;
    branches = new ArrayList<Branch>();
    PVector start = new PVector(0, 0);
    PVector end = new PVector(0, -len);
    branches.add(new Branch(sentence.charAt(0), 0, new PVector(), new PVector(0, -len), 0));
    for (int i = 0; i < 7; i++) {
      generate();
    }
    removeX();
  }
  
  void generate() {
    len *= 0.5;
    ArrayList<Branch> next = new ArrayList<Branch>();
    for (Branch b : branches) {
      char c = b.c;
      PVector bStart = b.start.get();
      PVector bEnd = b.end.get();
      float t = b.theta;
      PVector v = new PVector();
      switch (c) {
        case 'F': // F → FF
          v.set((bStart.x + bEnd.x)/2, (bStart.y + bEnd.y)/2); // midpoint
          next.add(new Branch('F', b.gen, bStart, v, t)); // F
          next.add(new Branch('F', b.gen, v, bEnd, t)); // F
          continue;
        case 'X': // X → F[+X][-X]FX
          v.set(0, -len);
          v.rotate(t);
          Branch f1 = new Branch('F', b.gen + 1, bStart, PVector.add(v, bStart), t);
          next.add(f1); // F
          next.add(new Branch('X', b.gen + 1, f1.end, f1.end, t + theta)); // [+X]
          next.add(new Branch('X', b.gen + 1, f1.end, f1.end, t - theta )); // [-X]
          Branch f2 = new Branch('F', b.gen + 1, f1.end, PVector.add(v, f1.end), t);
          next.add(f2); // F
          next.add(new Branch('X', b.gen + 1, f2.end, f2.end, t)); // X
          continue;
        default:
          continue;
      }
    }
    branches = next;
  }
  
  void removeX() {
    Iterator<Branch> iter = branches.iterator();
    while (iter.hasNext()) {
      Branch b = iter.next();
      if (b.c == 'X') { iter.remove(); }
    }
  }
  
  void grow() {
    boolean done = true;
    for (Branch b : branches) {
      if (b.gen == growGen && b.getCurrentLen() < b.len) {
        done = false;
        break;
      }
    }
    if (done == true) {
      growGen++;
    }
    Branch prev = branches.get(0);
    for (int n = 0; n < branches.size(); n++) {
      Branch b = branches.get(n);
      if (n == 0) { b.grow();}
      if (b.gen == growGen) {
        b.grow();
    }
  }
 }      
  
  void display() {
    for (Branch b : branches) {
      if (b.getCurrentLen() > 0) {
        b.display();
      }
    }
  }
}
