class Particle extends VerletParticle2D {
  
  float alpha;
  // VerletParticles use Vec2D and Vec3D vector classes 
  
  Particle(Vec2D loc) { // initial position
    super(loc);
    alpha = 255;
  }
  
  void display() {
    fill(175, alpha);
    stroke(175, alpha);
    ellipse(x, y, 16, 16); // use coords from superclass
  }
}
