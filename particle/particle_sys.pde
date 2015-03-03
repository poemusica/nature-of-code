class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem() {
    origin = new PVector(width/2, height/4);
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
