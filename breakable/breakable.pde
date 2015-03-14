class Breakable {
  PVector loc;
  float size;
  ParticleSystem pieces;
  boolean isBroken;
  
  Breakable() {
    size = 100;
    loc = new PVector(random(size, width - size), random(size, height - size));
    pieces = new ParticleSystem(loc, size);
    isBroken = false;
  }
  
  boolean isDestroyed() {
    if (pieces.plist.size() == 0) { return true; }
    return false;
  }
  
  void display() {
    if (isBroken) { pieces.run(); }
    else {
      stroke(130);
      fill(130);
      pushMatrix();
      translate(loc.x, loc.y);
      rect(0, 0, size, size);
      popMatrix();
    }
  }
  
}
