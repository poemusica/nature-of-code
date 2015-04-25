class HexGrid {
  // define hexagon and spacing
  PShape hexagon;
  float size; // edge and center-to-corner distance
  float horiz; // horizontal distance from one hex to another
  float vert; // vertical distance from one hex to another
  // define grid
  int rows, cols;
  // define neighbors
  PVector[] directions;
  // data
  int[][] read, write, temp; // display and calculate using read. update using write.
  
  HexGrid(float _size) {
    size = _size;
    registerHex();
    horiz = 1.5 * size;
    vert = sqrt(3) * size;
    rows = 38;
    cols = 38;
    setDirections();
    read = new int[rows][cols];
    write = new int[rows][cols];
    temp = write;
    init();
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
  
  void setDirections() {
    directions = new PVector[6];
    PVector v = new PVector(1, 0);
    directions[0] = v.get();
    v.set(1, -1);
    directions[1] = v.get();
    v.set(0, -1);
    directions[2] = v.get();
    v.set(-1, 0);
    directions[3] = v.get();
    v.set(-1, 1);
    directions[4] = v.get();
    v.set(0, 1);
    directions[5] = v.get();
  }
  
  void init() {
    for (int r = 1; r < rows -1; r++) {
      for (int q = 1; q < cols - 1; q++) {
        write[r][q] = int(random(2)); // 1 or 0
      }
    }
  }
  
  void run() {
    temp = write;
    write = read;
    read = temp;
    update();
    display();
  }
  
  void update() {
    for (int r = 1; r < rows - 1; r++) {
      for (int q = 1; q < cols - 1; q++) {
        write[r][q] = applyRule(q, r);
      }
    }
  }
  
  int applyRule(int col, int row) {
    int value = read[row][col];
    int count = 0; // number of live neighbors
    PVector cell = new PVector(col, row);
    PVector neighbor = new PVector();
    for (int i = 0; i < 6; i++) {
      neighbor = directions[i].get();
      neighbor.add(cell);
      count += read[(int)neighbor.y][(int)neighbor.x];
    }
    if (value == 1 && count < 2) { return 0; } // alive with <2 neighbors ==> dead
    if (value == 1 && count > 3) { return 0; } // alive with >3 neighbors ==> dead
    if (value == 0 && count == 3) { return 1; } // dead with 3 live neighbors ==> alive 
    return value; // otherwise, don't change
  }
  
  PVector hexToCart(int col, int row) {
    PVector p = new PVector();
    p.x = col * horiz;
    p.y = (col * 0.5 + row) * vert;
    return p;
  }
  
  void display() {
    for (int r = 0; r < rows; r++) {
      for(int q = 0; q < cols; q++) {
        if (read[r][q] == 1) {
          hexagon.setFill(color(0));
        } else { hexagon.setFill(color(255)); }
        PVector p = hexToCart(q, r);
        shape(hexagon, p.x, p.y);
      }
    }
  }
  
}
