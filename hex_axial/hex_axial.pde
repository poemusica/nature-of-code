class HexGrid {
  PShape hexagon;
  float size; // edge and center-to-corner distance
  float w; // corner to opposite corner
  float h; // edge center to opposite edge center
  
  HexGrid(float _size) {
    size = _size;
    w = size * 2;
    h = sqrt(3)/2 * w;
    registerHex();
  }
  
  void registerHex() {
    hexagon = createShape();
    hexagon.beginShape();
    hexagon.stroke(0);
    for (int i = 0; i < 6; i++) {
      float ang = radians(60 * i);
      hexagon.vertex(size * cos(ang), size * sin(ang));
    }
    hexagon.endShape(CLOSE);
  }
  
  void display() {
    
  }
  
}
