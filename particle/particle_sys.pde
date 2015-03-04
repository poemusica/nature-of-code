class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector p) {
    origin = p.get();
    particles = new ArrayList<Particle>();
  }
  
  void run() {
    particles.add(new Particle(origin));
    
    Iterator<Particle> iter = particles.iterator();
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.run();
      if (p.isDead()) { iter.remove(); }
    }
  }
}
