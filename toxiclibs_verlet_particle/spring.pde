class Spring extends VerletSpring2D {
    
  Spring(Particle p1, Particle p2, float _len, float _stren) {

    super(p1, p2, 80, 0.01);

    p1.lock();
    
    physics.addParticle(p1);
    physics.addParticle(p2);
    physics.addSpring(this);
  }
  
  void repo() {
    if (mousePressed) {
      p2.lock();
      p2.x = mouseX;
      p2.y = mouseY;
      p2.unlock();
    }
  }
  
  void display() {
    line(p1.x, p1.y, p2.x, p2.y); 
    p1.display();
    p2.display();
  }
  
}
