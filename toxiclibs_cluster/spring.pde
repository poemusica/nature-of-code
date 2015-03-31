class Spring extends VerletSpring2D {
  Node n1, n2;
 
  Spring(Node _n1, Node _n2, float len, float str) {
    super(_n1, _n2, len, str);
    n1 = _n1;
    n2 = _n2;

  }
  
  void display() {
    line(n1.x, n1.y, n2.x, n2.y); 
  }
  
}
