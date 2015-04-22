Lattice hexLattice;

void setup() {
  size(1200, 1100, P2D);
  hexLattice = new Lattice(0, 2);
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  hexLattice.displayLayer5(0, 0);
  ellipse(0, 0, 3, 3);  
  popMatrix();
}
