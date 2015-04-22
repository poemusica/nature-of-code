class Lattice {
  PShape hexagon; // basic shape
  float edge; // width from center to vertex. and width of edges.
  float ang; // interior angle
  float perp; // normalized width from center to edge midpoint. 
  int layers; // number of layers in lattice
  ArrayList<PVector> latticeVerts; 
  
  Lattice(int _layers, float hexSize) {
    layers = _layers;
    latticeVerts = new ArrayList<PVector>();
    edge = hexSize;
    ang = PI/3;
    perp = sin(ang);
    registerHex();
  }
  
  void registerHex() { // register hexagon as a PShape
    PVector u = new PVector(edge, 0);
    hexagon = createShape();
    hexagon.beginShape();
    hexagon.stroke(0);
    for (int i = 0; i < 6; i++) {
      hexagon.vertex(u.x, u.y);
      u.rotate(ang);
    }
    hexagon.endShape(CLOSE);
  }
  
  void displayLayer5(float x, float y) {
    pushMatrix();
    translate(x, y);
    hexagon.setFill(color(100, 35, 125));
    displayLayer4(0, 0);
    PVector v = new PVector();
    v.x = edge * -84;
    v.y = perp * edge * 14;
    float rot = v.heading();
    float scale = v.mag() / edge;
    hexagon.setFill(color(255, 35, 125));
    for (int i = 0; i < 6; i++) { // six outer layer2s
      hexagon.getVertex(i, v);
      v.rotate(rot);
      v.mult(scale);
      displayLayer4(v.x, v.y);
    }
    popMatrix();
  }
  
  void displayLayer4(float x, float y) {
    pushMatrix();
    translate(x, y);
    displayLayer3(0, 0);
    PVector v = new PVector();
    v.x = edge * -31.5;
    v.y = perp * edge * -7;
    float rot = v.heading();
    float scale = v.mag() / edge;
    for (int i = 0; i < 6; i++) { // six outer layer2s
      hexagon.getVertex(i, v);
      v.rotate(rot);
      v.mult(scale);
      displayLayer3(v.x, v.y);
    }
    popMatrix();
  }
  
  void displayLayer3(float x, float y) {
    pushMatrix();
    translate(x, y);
    displayLayer2(0, 0);
    PVector v = new PVector();
    v.x = edge * -12;
    v.y = perp * edge * 2;
    float rot = v.heading();
    float scale = v.mag() / edge;
    for (int i = 0; i < 6; i++) { // six outer layer2s
      hexagon.getVertex(i, v);
      v.rotate(rot);
      v.mult(scale);
      displayLayer2(v.x, v.y);
    }
    popMatrix();
  }
  
  void displayLayer2(float x, float y) {
    pushMatrix();
    translate(x, y);
    displayLayer1(0, 0); // center layer1
    PVector v = new PVector();
    v.x = edge * -3;
    v.y = perp * edge * 4;
    float rot = v.heading();
    float scale = v.mag() / edge;
    for (int i = 0; i < 6; i++) { // six outer layer1s
      hexagon.getVertex(i, v);
      v.rotate(rot);
      v.mult(scale);
      displayLayer1(v.x, v.y);
    }
    popMatrix();
  }
  
  void displayLayer1(float x, float y) {
    pushMatrix();
    translate(x, y);
    displayHex(0, 0); // center hex
    PVector v = new PVector();
    for (int i = 0; i < 6; i++) { // six outer hexes
      hexagon.getVertex(i, v);
      v.rotate(PI/2);
      v.mult(perp * 2);
      displayHex(v.x, v.y);
    }
    popMatrix();
  }
  
  void displayHex(float x, float y) { // draw a single hexagon
    shape(hexagon, x, y);
  }
  
}
