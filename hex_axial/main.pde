HexGrid grid; 
PShape hexagon;

void setup(){
  size(800, 800, P2D);
  grid = new HexGrid(8);
}

void draw() {
  grid.run();
}
