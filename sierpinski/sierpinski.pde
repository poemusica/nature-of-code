PShape triangle;

void setup() {
  size(640, 600, P2D);
  registerTri();
}

void draw() {
  translate(width/2, height - height/3);
  PVector v = new PVector();
  generate(5, v, 1);
}

void generate(int n, PVector loc, float scale) {
  if (n <= 1) {
    triangle.setFill(color(0));
    triangle.scale(scale);
    shape(triangle, loc.x, loc.y);
    triangle.resetMatrix();
    // debug
    fill(255);
    ellipse(loc.x, loc.y, 2, 2);
  }
  else {
    for (int i = 0; i < 3; i++) {
      triangle.scale(scale);
      PVector v = triangle.getVertex(i);
      v.add(loc);
      v.mult(0.5);
      triangle.resetMatrix();
      generate(n-1, v, scale/2);
    }
  }
}

void registerTri() {
  PVector u = new PVector(300, 0);
  triangle = createShape();
  triangle.beginShape();
  u.rotate(-PI/2);
  for (int i = 0; i < 3; i++) {
    u.rotate(radians(120));
    triangle.vertex(u.x, u.y);
  }
  triangle.endShape(CLOSE);
}
