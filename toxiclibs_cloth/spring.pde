class Spring extends VerletSpring2D {
  Particle p1, p2;
 
  Spring(Particle _p1, Particle _p2, float len, float str) {
    super(_p1, _p2, len, str);
    
    p1 = _p1;
    p2 = _p2;

  }
  
  void display() {
    line(p1.x, p1.y, p2.x, p2.y); 
  }
  
}
