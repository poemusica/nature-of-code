Path path;
Vehicle vehicle;

void setup() {
  size(640, 360);
  path = new Path();
  vehicle = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  path.display();
  
  vehicle.followPath(path);
  vehicle.update();
  vehicle.display();
  if (vehicle.lapComplete(path)) {
    path.update();
    vehicle.wrapAround(path); // confines vehicle to track length
  }
}
