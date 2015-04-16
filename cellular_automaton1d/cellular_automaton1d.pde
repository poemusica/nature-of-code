class CA{
  
  int[]cells;
  int[] cellSeed;
  int[] rules; // could pick a number from 0-255 and convert the binary to a list
  int w, n, gen;
  
  CA() {
    gen = 0;
    w = 10;
    cells = new int[width/w];
    initCells();
    cellSeed = new int[width/w];
    arrayCopy(cells, cellSeed);
    rules = new int[8];
    getRules();
  }
  
  void getRules() {
    int n = int(random(0, 256));
    String s = binary(n, rules.length); // convert number to 8-bit string
    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      rules[rules.length - 1 - i] = Character.getNumericValue(c); // digits ordered in reverse
    }
    // debug
    println(n, s, Arrays.toString(rules));
  }
  
  void initCells() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = round(random(0, 1));
//      cells[i] = 0;
    }
    
//    cells[cells.length/2] = 1;
  }
  
  void run() {
    if (frameCount % 10 == 0) {
      step();
    }
    display();
  }
  
  int applyRule(int a, int b, int c) { // 7 ==> rules[0], 6 ==> rules[1], 5 ==> rules[2], etc.
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
  
  void reset() {
    gen = 0;
    getRules();
    arrayCopy(cellSeed, cells);
  }
  
  void display() {
    noStroke();
    if (gen*w > height) {
      reset();
      fill(255);
      rect(0, 0, width, height);
    }
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(0);
        rect(i*w, gen*w, w, w);
      }
    }
  }
  
}
