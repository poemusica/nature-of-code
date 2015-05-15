class LSystem {
  String sentence;
  float len, theta;
  ArrayList<Branch> branches;
  ArrayList<Branch> currentGen;
  
  LSystem(String axiom, float _len, float _theta) {
    sentence = axiom;
    len = _len;
    theta = _theta;
    branches = new ArrayList<Branch>();
    currentGen = new ArrayList<Branch>();
    PVector start = new PVector(0, 0);
    PVector end = new PVector(0, -len);
    branches.add(new Branch(start, end));
    currentGen.add(new Branch(start, end));
  }
  
  // FF +[+F-F-F] -[-F+F+F]
  
  void generate() {
    len *= 0.5;
    ArrayList<Branch> next = new ArrayList<Branch>();
    for (Branch b : currentGen) {
      PVector bEnd = b.end.get(); // FF
      float bTheta  = PVector.angleBetween(bEnd, new PVector());
      PVector v = new PVector(0, -len); // figure out how to rotate / add this to end of b
      v.rotate(bTheta + theta); // +[
      v.rotate(theta); // +
      Branch b1 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b1);
      branches.add(b1);
      v.rotate(-theta); // -
      Branch b2 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b2);
      branches.add(b2);
      v.rotate(-theta); // -
      Branch b3 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b3);
      branches.add(b3);
      v.set(0, -len); // ]
      v.rotate(bTheta - theta); // -[
      v.rotate(-theta); // -
      Branch b4 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b4);
      branches.add(b4);
      v.rotate(theta); // +
      Branch b5 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b5);
      branches.add(b5);
      v.rotate(theta); // +
      Branch b6 = new Branch(bEnd, PVector.add(bEnd, v)); // F
      next.add(b6);
      branches.add(b6);
      // ] ?
    }
    currentGen = next;
  }
  
  void display() {
    for (Branch b : branches) {
      b.display();
    }
  }
  
  void changeTheta() {
    theta += map(noise(frameCount/1000, millis()/1000), 0, 1,  radians(-0.1), radians(0.1));
    theta = constrain(theta, PI/12, PI/6);
  }
  
  void scaleLen(float n) {
    len *= n;
  }
}
