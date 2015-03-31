class MinSpring extends VerletConstrainedSpring2D {
  Node n1, n2;
 
  MinSpring(Node _n1, Node _n2, float len, float str) {
    super(_n1, _n2, len, str);
    n1 = _n1;
    n2 = _n2;

  }
  
  void display() {
    strokeWeight(1);
    line(n1.x, n1.y, n2.x, n2.y); 
  }
  
}
