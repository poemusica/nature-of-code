class Pendulum {
  ArrayList<Particle> particles;
  float len, numParticles;
  
  Pendulum() {
    particles = new ArrayList<Particle>();
    len = 10;
    numParticles = 20;
    
    for (int i = 0; i < numParticles; i++) {
      Particle p = new Particle( new Vec2D(width/2, i * len));
      particles.add(p);
      physics.addParticle(p);
      
      if (i != 0) { // connect the particles to make a string
        Particle prev = particles.get(i - 1);
        VerletSpring2D spring = new VerletSpring2D(p, prev, len, 0.08);
        physics.addSpring(spring);
      }
    }
    
    Particle head = particles.get(0);
    head.lock();
  }
  
  void repo() {
    if (mousePressed) {
      Vec2D m = new Vec2D(mouseX, mouseY);
      Particle tail = particles.get(particles.size() - 1);
      Vec2D t = new Vec2D(tail.x, tail.y);
      if (m.distanceTo(t) <= 32)
      {
        tail.lock();
        tail.x = m.x;
        tail.y = m.y;
        tail.unlock();
      }
    }
  }
  
  
  void display() {
    stroke(0);
    noFill();
    beginShape();
    for (Particle p : particles) {
      vertex(p.x, p.y);
    }
    endShape();
    Particle tail = particles.get(particles.size() - 1);
    tail.display();
  }
  
}
