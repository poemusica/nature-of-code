class MouseWalker {
  float x;
  float y;
  
  MouseWalker() {
    x = width/2;
    y = height/2;
  }
  
  void display() {
    stroke(0);
    point(x, y);
  }
  
  void step() {
    float r = random(1);
    if (r < 0.125){
      y--; // up
    }
    else if (r < 0.25){
      y++; // down
    }
    else if (r < 0.375){
      x--; // left
    }
    else if (r < 0.5){
      x++; // right
    }
    else { // move toward mouse
      if (mouseX < x) { x--; }
      else if (mouseX > x) { x++; }
      if (mouseY < y) { y--; }
      else if (mouseY > y) { y++; }
    }
    
  }
  
}
