class FireSystem extends ParticleSystem {

  FireSystem(PVector _orig) {
    super(_orig);
  }
  
  void addParticle() {
    float r = random(1);
    if (r < 0.6) {
      particles.add(new Ember(origin));
    } else if (r < 0.8) {
      particles.add(new Fire(origin));
    } else {
      particles.add(new Blue(origin));
    }
  }
}
