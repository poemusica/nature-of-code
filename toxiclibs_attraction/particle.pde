class Particle extends VerletParticle2D {
  
  float size, distance, strength;
  
  Particle(Vec2D pos) {
    super(pos);
    size = 10;
    distance = size * 4;
    strength = -0.1;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, distance, strength));
  }
  
  void display() {
    ellipse(x, y, size, size);
  }
}
