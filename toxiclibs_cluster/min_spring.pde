class MinSpring extends VerletMinDistanceSpring2D {
  Node n1, n2;
  PVector sCol;
  
  MinSpring(Node _n1, Node _n2, float len, float str, PVector _sCol) {
    super(_n1, _n2, len, str);
    n1 = _n1;
    n2 = _n2;
    sCol = new PVector();
    sCol.set(_sCol);
  }
  
  void display() {
    stroke(sCol.x, sCol.y, sCol.z, 175);
    line(n1.x, n1.y, n2.x, n2.y); 
  }
  
}
