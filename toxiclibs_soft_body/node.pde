class Node extends VerletParticle2D {
  
  Node(Vec2D pos) {
    super(pos);
    physics.addParticle(this);
//    AngularConstraint angle = new AngularConstraint(this, 10);
//    this.addConstraint(angle);
    
  }
  
  void display() {
    ellipse(x, y, 5, 5);
  }
}
