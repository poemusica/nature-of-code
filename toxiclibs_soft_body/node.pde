class Node extends VerletParticle2D {
  
  Node(Vec2D pos) {
    super(pos);
  }
  
  void display() {
    ellipse(x, y, 5, 5);
  }
}
