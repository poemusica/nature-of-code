class CA{
  
  int[]cells;
  int[] rules; // could pick a number from 0-255 and convert the binary to a list
  int w = 10; // width and height of square
  int gen = 0;
  
  CA() {
    cells = new int[width/w];
    rules = new int[]{0, 1, 0, 1, 1, 0, 1, 0}; // remember to list backwards
    initCells();
  }
  
  void initCells() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
  }
  
  void run() {
    if (frameCount % 10 == 0) {
      step();
    }
    display();
  }
  
  int applyRule(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2); // use base 2
    return rules[index];
  }
  
  void step() {
    int[] nextGen = new int[cells.length];
    for (int i = 1; i < cells.length - 1; i++) { // excludes first and last
      nextGen[i] = applyRule(cells[i-1], cells[i], cells[i+1]);
    }
    cells = nextGen;
    gen++;
  }
  
  void display() {
    noStroke();
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(0);
        rect(i*w, gen*w, w, w);
      }
    }
  }
  
}
