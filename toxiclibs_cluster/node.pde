class Node extends VerletParticle2D {
  Node(Vec2D pos) {
    super(pos);
  }
  
  void display() {
    fill(0, 150);
    stroke(0);
    ellipse(x, y, 16, 16);
  }
}
