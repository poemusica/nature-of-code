class CA {
  int w, rows, cols; // define grid
  Cell[][] cells;
  
  CA() {
    w = 10;
    rows = floor(height/w);
    cols = floor(width/w);
    cells = new Cell[rows][cols];
    init(); // initialize cells
  }
 
  void init() {
    float state = 0;
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        state = random(1);
        cells[i][j] = new Cell(j*w, i*w, w, state); 
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
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j].store();
      }
    }
  }
  
  void update() {
    Cell cell;
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cell = cells[i][j];
        cell.update(applyRule(i, j)); // applyRule computes new state
      }
    }
  }
  
  float applyRule(int row, int col) {
    Cell cell = cells[row][col];
    int count = 0; // number of live neighbors
    for(int i = -1; i <= 1; i++) {
      int r = row + i;
      if (r < 0) { r = rows - 1; } // wrap across rows
      if (r > rows - 1) { r = 0; }
      for(int j = -1; j <= 1; j++) {
        int c = col + j;
        if (c < 0) { c = cols - 1; } // wrap across columns
        if (c > cols - 1) { c = 0; }
        if (cells[r][c].prev >= 0.5) { count += 1; } // use previous state to tally
      }
    }
    count -= cell.prev; // don't include self
    if (cell.prev >= 0.5 && count < 2) { return cell.prev - 0.1; } // alive with <2 neighbors ==> dead
    if (cell.prev >= 0.5 && count > 3) { return cell.prev - 0.1; } // alive with >3 neighbors ==> dead
    if (cell.prev < 0.5 && count == 3) { return cell.prev + 0.1; } // dead with 3 live neighbors ==> alive 
    return cell.prev; // otherwise, don't change
  }
  
  void display() {
    rectMode(CORNER);
    stroke(0);
    for (Cell[] row : cells) {
      for (Cell cell : row) { cell.display(); }
    }
  }
}
