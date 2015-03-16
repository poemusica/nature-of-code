class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float lifespan;
  
  ParticleSystem(PVector _orig) {
    particles = new ArrayList<Particle>();
    origin = _orig.get();
    lifespan = 400;
  }
  
  boolean isDead() {
    if (lifespan <= 0 && particles.size() <= 0) { return true; }
    return false;
  }
  
  void addParticle() {
    float r = random(1);
    particles.add(new Particle(origin));
  }
  
  // for forces that affect the entire system
  void applyForce(PVector force) {
    for (Particle p : particles) {
      p.applyForce(force);
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
    lifespan -= 0;
  }
}
