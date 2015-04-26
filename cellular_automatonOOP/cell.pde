class Cell {
  int x, y; // location
  int w; // size
  float state; // current state
  float prev; // previous state
 
  Cell(int _x, int _y, int _w,  float _state) {
    x = _x;
    y = _y;
    w = _w;
    state = _state;
    prev = 0;
  }
  
  void store() {
    prev = state;
  }
  
  void update(float _state) {
    state = _state;
  }
  
  void display() {
    if (prev < 0.5 && state >= 0.5) { // birth
      fill(0, 0, 255);
    }
    else if (state >= 0.5) { // alive
      fill(0);
    }
    else if (prev >= 0.5 && state < 0.5) { // death
      fill(255, 0, 0);
    }
    else { fill(255); } // dead
    rect(x, y, w, w);
  }
}
