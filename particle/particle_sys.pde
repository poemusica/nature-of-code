class ParticleSystem {
  ArrayList<Particle> particles;
  
  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  void run() {
    particles.add(new Particle());
    
    Iterator<Particle> iter = particles.iterator();
    
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.run();
      if (p.isDead()) { iter.remove(); }
    }
  }
}
