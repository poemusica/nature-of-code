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
  vehicle.wander();
  vehicle.avoidEdges();
  vehicle.update();
  vehicle.display();
}
