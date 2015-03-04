class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  float lifespan;
  
  ParticleSystem(PVector p) {
    origin = p.get();
    particles = new ArrayList<Particle>();
    lifespan = 300;
  }
  
  boolean isDead() {
    if (lifespan <= 0 && particles.size() < 1) { return true; }
    return false;
  }
  
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  void run() {
    if (lifespan > 0){
      addParticle();
    }
    
    Iterator<Particle> iter = particles.iterator();
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.run();
      if (p.isDead()) { iter.remove(); }
    }
    
    lifespan -= 1;
  }
}
