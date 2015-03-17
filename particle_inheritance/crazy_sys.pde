class CrazySystem extends ParticleSystem {

  CrazySystem(PVector _orig) {
    super(_orig);
  }
  
    void addParticle() {
    particles.add(new Crazy(origin));
  }
}
