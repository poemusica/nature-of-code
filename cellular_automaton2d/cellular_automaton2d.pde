class CA {
  int w, rows, cols; // define grid
  int[][] cells; // current generation
  
  CA() {
    w = 10;
    rows = floor(width/w);
    cols = floor(height/w);
    cells = new int[rows][cols];
    init(); // initialize cells
  }
  
  void init() {
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j] = int(random(2)); // 0 or 1
      }
    }
  }
  
  void run() {
    step();
    display();
  }
  
  void step() {
    int[][] nextGen = new int[rows][cols];
    for(int i = 1; i < rows - 1; i++) { // exclude top and bottom row
      for(int j = 1; j < cols - 1; j++) { // exclude first and last column
        nextGen[i][j] = applyRule(i, j); // apply rule to compute state
      }
    }
    cells = nextGen;
  }
  
  int applyRule(int row, int col) {
    int cell = cells[row][col];
    int count = 0; // number of live neighbors
    for(int i = -1; i <= 1; i++) { 
      for(int j = -1; j <= 1; j++) {
        count += cells[row+i][col+j];
      }
    }
    count -= cell; // don't include self
    if (cell == 1 && count < 2) { return 0; } // alive with <2 neighbors ==> dead
    if (cell == 1 && count > 3) { return 0; } // alive with >3 neighbors ==> dead
    if (cell == 0 && count == 3) { return 1; } // dead with 3 live neighbors ==> alive 
    return cell; // otherwise, don't change
  }
  
  void display() {
    stroke(0);
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
       if (cells[i][j] == 1) {
         fill(0);
       } else {
         noFill();
       }
       rect(i*w, j*w, w, w);
      }
    }
  } 
}
