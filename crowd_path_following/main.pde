Path path;
Vehicle vehicle;

void setup() {
  size(640, 360);
  path = new Path();
  vehicle = new Vehicle(new PVector(0, 0));
}

void draw() {
  background(255);
  path.display();
  vehicle.followPath(path);
  vehicle.update();
  vehicle.display();
}
