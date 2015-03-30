class Node extends VerletParticle2D {
  PVector sCol;
  
  Node(Vec2D pos) {
    super(pos);
    sCol = new PVector(random(255), random(255), random(255));
  }
  
  void display() {
    fill(sCol.x, sCol.y, sCol.z, 110);
    stroke(sCol.x, sCol.y, sCol.z, 110);
    ellipse(x, y, 5, 5);
  }
}
