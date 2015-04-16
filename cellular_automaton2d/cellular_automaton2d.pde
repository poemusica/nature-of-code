class CA {
  int w, rows, cols; // define grid
  int[][] cells; // current generation
  boolean running;
  
  CA() {
    running = false;
    w = 10;
    rows = floor(height/w);
    cols = floor(width/w);
    cells = new int[rows][cols];
    clearCells();
//    init(); // initialize cells
  }
  
  void manualSetup() {
    if(mousePressed) {
      int row = constrain(floor(mouseY/w), 0, rows - 1);
      int col = constrain(floor(mouseX/w), 0, cols - 1);
      cells[row][col] = 1;
    }
  }
  
  void clearCells() { // swap for init if using manualSetup
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j] = 0; // all white
      }
    }
  } 
  
  void init() {
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        cells[i][j] = int(random(2)); // 0 or 1
      }
    }
  }
  
  void run() {
    if (running == false) {
      manualSetup();
    }
    if (running == true) {
      step();
    }
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
    rectMode(CORNER);
    stroke(0);
    for(int i = 0; i < rows; i++) { // y value
      for(int j = 0; j < cols; j++) { // x value
       if (cells[i][j] == 1) {
         fill(0);
       } else {
         noFill();
       }
       rect(j*w, i*w, w, w);
      }
    }
  } 
}
