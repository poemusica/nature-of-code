class HexGrid {
  // define hexagon and spacing
  float size; // edge and center-to-corner distance
  float horiz; // horizontal distance from one hex to another
  float vert; // vertical distance from one hex to another
  // define grid
  int rows, cols;
  
  HexGrid(float _size) {
    size = _size;
    registerHex();
    horiz = 1.5 * size;
    vert = sqrt(3) * size;
    rows = 50;
    cols = 50;
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
  
  void run() {
    display();
  }
  
  PVector hexToCart(int col, int row) {
    PVector p = new PVector();
    p.x = col * horiz;
    p.y = (col * 0.5 + row) * vert;
    return p;
  }
  
  void display() {
    PVector p = new PVector();
    hexagon.setFill(color(0, 0, 255));
    for (int r = 0; r < rows; r++) {
      for(int q = 0; q < cols; q++) {
        p = hexToCart(q, r);
        shape(hexagon, p.x, p.y);
      }
    }
  }
  
}
