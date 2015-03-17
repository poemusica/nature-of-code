class SmokeSystem extends ParticleSystem {

  SmokeSystem(PVector _orig) {
    super(_orig);
  }
  
    void addParticle() {
    particles.add(new Smoke(origin));
  }
}
