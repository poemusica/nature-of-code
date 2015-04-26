class HexGrid {
  // define hexagon and spacing
  float size; // edge and center-to-corner distance
  float horiz; // horizontal distance from one hex to another
  float vert; // vertical distance from one hex to another
  // define grid
  int rows, cols;
  // define neighbors
  PVector[] directions;
  // data
  Cell[][] cells;
  
  HexGrid(float _size) {
    size = _size;
    registerHex();
    horiz = 1.5 * size;
    vert = sqrt(3) * size;
    rows = 50;
    cols = 50;
    setDirections();
    cells = new Cell[rows][cols];
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
    int state = 0;
    PVector v = new PVector();
    for (int r = 0; r < rows; r++) {
      for (int q = 0; q < cols; q++) {
        state = int(random(2));
        v = hexToCart(q, r);
        cells[r][q] = new Cell(v.x, v.y, state); // 1 or 0
      }
    }
  }
  
  void run() {
    if (frameCount % 2 == 0) {
      store();
      update();
    }
    display();
  }
  
  void store() {
    for (int r = 0; r < rows; r++) {
      for (int q = 0; q < cols; q++) {
        cells[r][q].store();
      }
    }
  }
  
  void update() {
    Cell cell;
    for (int r = 0; r < rows; r++) {
      for (int q = 0; q < cols; q++) {
        cell = cells[r][q]; 
        cell.update(applyRule(q, r));
      }
    }
  }
  
  int applyRule(int col, int row) {
    Cell cell = cells[row][col];
    int count = 0; // number of live neighbors
    PVector loc = new PVector(col, row);
    PVector neighbor = new PVector();
    for (int i = 0; i < 6; i++) {
      neighbor = directions[i].get();
      neighbor.add(loc);
      if (neighbor.x < 0) { neighbor.x = cols - 1; } // col check
      if (neighbor.x > cols - 1) { neighbor.x = 0; }
      if (neighbor.y < 0) { neighbor.y = rows - 1; } // row check
      if (neighbor.y > rows - 1) { neighbor.y = 0; }
      count += cells[(int)neighbor.y][(int)neighbor.x].prev;
    }
    if (cell.prev == 1 && count < 2) { return 0; } // alive with <2 neighbors ==> dead
    if (cell.prev == 1 && count > 3) { return 0; } // alive with >3 neighbors ==> dead
    if (cell.prev == 0 && count == 3) { return 1; } // dead with 3 live neighbors ==> alive 
    return cell.prev; // otherwise, don't change
  }
  
  PVector hexToCart(int col, int row) {
    PVector p = new PVector();
    p.x = col * horiz;
    p.y = (col * 0.5 + row) * vert;
    return p;
  }
  
  void display() {
    for (Cell[] row : cells) {
      for (Cell cell : row) {
        cell.display();
      }
    }
  }
  
}
