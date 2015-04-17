class Cell {
  int x, y; // location
  int w; // size
  int state; // current state
  int prev; // previous state
 
  Cell(int _x, int _y, int _w, int _state) {
    x = _x;
    y = _y;
    w = _w;
    state = _state;
    prev = 0;
  }
  
  void store() {
    prev = state;
  }
  
  void update(int _state) {
    state = _state;
  }
  
  void display() {
    if (prev == 0 && state == 1) { // birth
      fill(0, 0, 255);
    }
    else if (state == 1) { // alive
      fill(0);
    }
    else if (prev == 1 && state == 0) { // death
      fill(255, 0, 0);
    }
    else { fill(255); } // dead
    rect(x, y, w, w);
  }
}
