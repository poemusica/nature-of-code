class Cell {
  float x, y; // location
  int state; // current state
  int prev; // previous state
 
  Cell(float _x, float _y, int _state) {
    x = _x;
    y = _y;
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
      hexagon.setFill(color(0, 0, 255));
    }
    else if (state == 1) { // alive
      hexagon.setFill(color(0));
    }
    else if (prev == 1 && state == 0) { // death
      hexagon.setFill(color(255, 0, 0));
    }
    else { hexagon.setFill(color(255)); } // dead
    shape(hexagon, x, y);
  }
}
