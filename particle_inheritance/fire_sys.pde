class FireSystem extends ParticleSystem {

  FireSystem(PVector _orig) {
    super(_orig);
  }
  
  void addParticle() {
    float r = random(1);
    if (r < 0.85) {
      particles.add(new Ember(origin));
    } else {
      particles.add(new Fire(origin));
    }
  }
}
