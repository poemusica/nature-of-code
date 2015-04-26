HexGrid grid;
PShape hexagon; 
Vehicle vehicle;

void setup(){
  size(800, 800, P2D);
  grid = new HexGrid(6);
  PVector v = new PVector();
  v.x = int(random(grid.cols));
  v.y = int(random(grid.rows));
  vehicle = new Vehicle(v);
}

void draw() {
  grid.display();
  vehicle.update();
  vehicle.display();
}
