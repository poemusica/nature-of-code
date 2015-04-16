class CA{
  
  int[]cells;
  int[] cellSeed;
  int[][] history;
  int[] rules;
  int w, gen, rows, cols, pointer;
  
  CA() {
    gen = 0;
    w = 10;
    rows = height/w;
    cols = width/w;
    cells = new int[cols];
    initCells();
    cellSeed = new int[cols];
    arrayCopy(cells, cellSeed);
    rules = new int[8];
    getRules();
    history = new int[rows][cols];
    pointer = gen;
    history[gen] = cellSeed; 
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
    }
  }
  
  void run() {
    if (frameCount % 2 == 0) {
      step();
    }
//    noScroll();
    scroll();
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
    int last = cells.length-1;
    nextGen[0] = applyRule(cells[last], cells[0], cells[1]);
    nextGen[last] = applyRule(cells[last-1], cells[last], cells[0]);
    cells = nextGen;
    gen++;
    if ( gen <= rows - 1) {
      history[gen] = nextGen;
    } else {
      pointer = gen % rows;
      history[pointer] = nextGen;
      pointer = (pointer + 1) % rows;
    }
  }
  
  void reset() {
    gen = 0;
    getRules();
    arrayCopy(cellSeed, cells);
  }
  
  void scroll() {
    background(255);
    for (int i = pointer; i < history.length; i++) {
      int[] row = history[i];
      display(row, i - pointer);
    }
    int comp = history.length - pointer;
    for (int i = 0; i < pointer; i++) {
      int[] row = history[i];
      display(row, comp + i);
    }
  }
  
  void display(int[] row, int j) {
    noStroke();
    for (int i = 0; i < row.length; i++) {
      if (row[i] == 1) {
        fill(0);
        rect(i*w, j*w, w, w);
      }
    }
  }
  
  void noScroll() {
    noStroke();
    if (gen >= rows - 1) {
      reset();
      background(255);
    }
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) {
        fill(0);
        rect(i*w, gen*w, w, w);
      }
    }
  }
  
}
