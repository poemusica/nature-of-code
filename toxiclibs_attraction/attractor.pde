class Attractor extends VerletParticle2D {
  
  float size, distance, strength;
  
  Attractor(Vec2D pos) {
    super(pos);
    size = 30;
    distance = width;
    strength = 0.05;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, distance, strength));
    physics.addBehavior(new AttractionBehavior(this, size * 3, -2 * strength));
    this.lock();
  }
  
  void display() {
    ellipse(x, y, size, size);
  }
}
