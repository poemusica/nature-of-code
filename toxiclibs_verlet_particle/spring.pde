class Spring{
  Particle p1, p2;
  VerletSpring2D s;
  
  Spring() {
    Vec2D v1 = new Vec2D(100, 20);
    Vec2D v2 = new Vec2D(100, 180);
    p1 = new Particle(v1);
    p2 = new Particle(v2);
    float len = 80.0;
    float str = 0.01;
    s = new VerletSpring2D(p1, p2, len, str);
     
    physics.addParticle(p1);
    physics.addParticle(p2);
    physics.addSpring(s);
    p1.lock();
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
