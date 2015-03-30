class MinSpring extends VerletMinDistanceSpring2D {
  Node n1, n2;
  PVector sCol;
 
  MinSpring(Node _n1, Node _n2, float len, float str) {
    super(_n1, _n2, len, str);
    sCol = new PVector(random(255), random(255), random(255));
    n1 = _n1;
    n2 = _n2;

  }
  
  void display() {
    strokeWeight(1);
    stroke(sCol.x, sCol.y, sCol.z, 110);
    line(n1.x, n1.y, n2.x, n2.y); 
  }
  
}
