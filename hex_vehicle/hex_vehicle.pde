class Vehicle {
  PVector loc, vel;
  
  Vehicle(PVector _loc) {
    loc = _loc.get();
    vel = new PVector(1, 0);
  }
  
  void wrap() {
    if (loc.x < 0) { loc.x = grid.cols - 1; } // col check
    if (loc.x > grid.cols - 1) { loc.x = 0; }
    if (loc.y < 0) { loc.y = grid.rows - 1; } // row check
    if (loc.y > grid.rows - 1) { loc.y = 0; }
  }
  
  void update() {
    vel.set(int(random(-2, 2)), int(random(-2, 2)));
    loc.add(vel);
    wrap();
  }
  
  void display() {    
    PVector v = new PVector();
    v = grid.hexToCart((int)loc.x, (int)loc.y);
    hexagon.setFill(color(0, 255, 0));
    shape(hexagon, v.x, v.y);
  }
}
