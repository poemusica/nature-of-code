class CA {
  int w, rows, cols; // define grid
  // swap read and write every frame
  int[][] read; // display and calculate using read
  int[][] write; // step using write
  int[][] temp;
  boolean running;
  
  CA() {
    running = false;
    w = 10;
    rows = floor(height/w);
    cols = floor(width/w);
    read = new int[rows][cols];
    write = new int[rows][cols];
    temp = write;
    init(); // initialize cells
//    manualSetup();
  }
  
  void manualSetup() {
    if(mousePressed) {
      int row = constrain(floor(mouseY/w), 0, rows - 1);
      int col = constrain(floor(mouseX/w), 0, cols - 1);
      write[row][col] = 1;
      read[row][col] = 1; // hacky solution but it works
    }
  }
  
  void clearCells() { // swap for init if using manualSetup
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        write[i][j] = 0; // all white
        read[i][j] = 0;
        temp[i][j] = 0;
      }
    }
  } 
  
  void init() {
    running = true;
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        write[i][j] = int(random(2)); // 0 or 1
      }
    }
  }
  
  void run() {
    if (running == false) {
      manualSetup();
    }
    if (running == true) {
      temp = write;
      write = read; // overwrite the previous read data
      read = temp; // read what you just wrote
      step();
    }
    display();
  }
  
  void step() {
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        write[i][j] = applyRule(i, j); // apply rule to compute state
      }
    }
  }
  
  int applyRule(int row, int col) {
    int cell = read[row][col];
    int count = 0; // number of live neighbors
    for(int i = -1; i <= 1; i++) {
      int r = row + i;
      if (r < 0) { r = rows - 1; } // wrap across rows
      if (r > rows - 1) { r = 0; }
      for(int j = -1; j <= 1; j++) {
        int c = col + j;
        if (c < 0) { c = cols - 1; } // wrap across columns
        if (c > cols - 1) { c = 0; }
        count += read[r][c];
      }
    }
    count -= cell; // don't include self
    if (cell == 1 && count < 2) { return 0; } // alive with <2 neighbors ==> dead
    if (cell == 1 && count > 3) { return 0; } // alive with >3 neighbors ==> dead
    if (cell == 0 && count == 3) { return 1; } // dead with 3 live neighbors ==> alive 
    return cell; // otherwise, don't change
  }
  
  void display() { // always display read
    rectMode(CORNER);
    stroke(0);
    for(int i = 0; i < rows; i++) { // y value
      for(int j = 0; j < cols; j++) { // x value
       if (read[i][j] == 1) {
         fill(0);
       } else {
         noFill();
       }
       rect(j*w, i*w, w, w);
      }
    }
  } 
}
