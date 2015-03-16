class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float lifespan;
  
  ParticleSystem(PVector _orig) {
    particles = new ArrayList<Particle>();
    origin = _orig.get();
    lifespan = 999999999;
  }
  
  boolean isDead() {
    if (lifespan <= 0 && particles.size() <= 0) { return true; }
    return false;
  }
  
  void addParticle() {
    float r = random(1);
    if (r < 0.5) {
      particles.add(new Triangle(origin));
    } else {
      particles.add(new Confetti(origin));
    }
  }
  
  void run() {
    if (lifespan > 0) { addParticle(); }
    
    Iterator<Particle> iter = particles.iterator();
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.run();
      if (p.isDead()) { iter.remove(); }
    }
    lifespan -= 1;
  }
}
