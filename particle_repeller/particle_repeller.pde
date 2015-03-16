class Repeller {
  PVector loc;
  float strength, size;
  
  Repeller(PVector _loc) {
    loc = _loc.get();
    strength = 100;
    size = 20;
  }
  
  // alternatively, repel functions only on particles and particle system has a method applyRepeller.
  void repel(ParticleSystem sys) {
    PVector force;
    float d;
    for (Particle p : sys.particles) {
      force = PVector.sub(p.loc, loc);
      d = force.mag();
      d = constrain(d, 20, 100);
      force.setMag(strength/sq(d));
      p.applyForce(force);
    }
  }
  
  void display() {
    stroke(255);
    fill(255);
    ellipse(loc.x, loc.y, size, size);
  }
}
