class ParticleSystem {
  ArrayList<Particle> particles;
  PVector loc;
  
  ParticleSystem() {
    loc = new PVector();
    particles = new ArrayList<Particle>();
  }
  
  void emit(PVector force, PVector origin, float refAng) {
    particles.add(new Particle(loc, force, origin, refAng));
  }
  
  void run() {
    Iterator<Particle> iter = particles.iterator();
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.run();
      if (p.isDead()) { iter.remove(); }
    }
  }
}
