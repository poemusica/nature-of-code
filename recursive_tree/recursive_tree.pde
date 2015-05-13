class Branch {
  PVector start, end;
  float weight, theta, len;

  Branch(PVector s, PVector e, float w, float t) {
    weight = w;
    theta = PVector.angleBetween(s, new PVector());
    theta += t;
    start = s.get();
    end = e.get();  
    len = PVector.dist(start, end);
  }
  
  void display() {
    stroke(0);
    strokeWeight(weight);
    line(start.x, start.y, end.x, end.y);
  }
}

class Leaf {
  PVector loc;

  Leaf(PVector _loc) {
    loc = _loc.get();
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, 15, 15);
  }
}

class Tree {
  ArrayList<Branch> branches;
  ArrayList<Branch> currentGen;
  ArrayList<Leaf> leaves;
  float len;
  int n;

  Tree(float _len, int _n) {
    len = _len;
    n = _n;
    branches = new ArrayList<Branch>();
    currentGen = new ArrayList<Branch>();
    leaves = new ArrayList<Leaf>();
    PVector start = new PVector(0, 0);
    PVector end = new PVector(0, -len);
    branches.add(new Branch(start, end, 4, 0));
    currentGen.add(new Branch(start, end, 4, 0));
    for (int i = 0; i < n; i++) {
      generate();
    }
    for (Branch b : currentGen) {
      leaves.add(new Leaf(b.end));
    }
  }
  
  void recalc() {
    branches.clear();
    currentGen.clear();
    leaves.clear();
    PVector start = new PVector(0, 0);
    PVector end = new PVector(0, -len);
    branches.add(new Branch(start, end, 4, 0));
    currentGen.add(new Branch(start, end, 4, 0));
    for (int i = 0; i < n; i++) {
      generate();
    }
    for (Branch b : currentGen) {
      leaves.add(new Leaf(b.end));
    }
  }

  void generate() {
    ArrayList<Branch> next = new ArrayList<Branch>();
    for (Branch b : currentGen) {
      PVector s = b.end.get(); // start point for both new branches
      PVector e = new PVector(0, -b.len * 0.66);
      float t = b.theta + ang;
      e.rotate(t);
      e.add(s);
      Branch bRight = new Branch(s, e, b.weight * 0.66, t);
      next.add(bRight);
      branches.add(bRight);

      t = b.theta - ang;
      e.set(0, -b.len * 0.66);
      e.rotate(t);
      e.add(s);
      Branch bLeft = new Branch(s, e, b.weight * 0.66, t);
      next.add(bLeft);
      branches.add(bLeft);
    }
    currentGen = next;
  }

  void display() {
    for (Branch b : branches) {
      b.display();
    }
    for (Leaf l : leaves) {
      l.display();
    }
  }
}

