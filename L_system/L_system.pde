class LSystem {
  float len, theta;
  ArrayList<Branch> branches;
  
  LSystem(float _len, float _theta) {
    len = _len;
    theta = _theta;
    branches = new ArrayList<Branch>();
    PVector start = new PVector(0, 0);
    PVector end = new PVector(0, -len);
    branches.add(new Branch(start, end));
  }
  
  void generate() { // rule: FF +[+F-F-F] -[-F+F+F]
    len *= 0.5;
    ArrayList<Branch> next = new ArrayList<Branch>();
    for (Branch b : branches) {
      PVector bStart = b.start.get();
      PVector bEnd = b.end.get();
      PVector v = new PVector((bStart.x + bEnd.x)/2, (bStart.y + bEnd.y)/2); // midpoint
      next.add(new Branch(bStart, v)); // F
      next.add(new Branch(v, bEnd)); // F
      
      PVector dir = PVector.sub(bEnd, bStart); 
      float bTheta = dir.heading() + PI/2;
      v.set(0, -len);
      v.rotate(bTheta);
      v.rotate(theta); // +[
      v.rotate(theta); // + 
      Branch b1 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b1);
      v.rotate(-theta); // -
      Branch b2 = new Branch(b1.end, PVector.add(b1.end, v)); // F
      next.add(b2);
      v.rotate(-theta); // -
      Branch b3 = new Branch(b2.end, PVector.add(b2.end, v)); // F
      next.add(b3);
      
      v.set(0, -len); // ]
      v.rotate(bTheta); // -[
      v.rotate(-theta); // -
      Branch b4 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b4);
      v.rotate(theta); // +
      Branch b5 = new Branch(b4.end, PVector.add(b4.end, v)); // F
      next.add(b5);
      v.rotate(theta); // +
      Branch b6 = new Branch(b5.end, PVector.add(b5.end, v)); // F
      next.add(b6);
    }
    branches = next;
    
  }
  
  void display() {
    for (Branch b : branches) {
      b.display();
    }
  }
}
