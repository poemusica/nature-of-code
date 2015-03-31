class Spring extends VerletSpring2D {
  VerletParticle2D p1, p2;
 
  Spring(VerletParticle2D _p1, VerletParticle2D _p2, float restLen, float str) {
    super(_p1, _p2, restLen, str);
    p1 = _p1;
    p2 = _p2;
    physics.addSpring(this);
  }
  
  void display() {
    line(p1.x, p1.y, p2.x, p2.y); 
  }
  
}
