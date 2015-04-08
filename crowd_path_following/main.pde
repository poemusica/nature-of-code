Path path;
ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  path = new Path();
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 25; i++) {
    Vehicle vehicle = new Vehicle(new PVector(random(width), random(height)));
    vehicles.add(vehicle);
  }
}

void draw() {
  background(255);
  path.display();
  for (Vehicle vehicle : vehicles) {
    vehicle.followPath(path);
    vehicle.separate(vehicles);
    vehicle.update();
    vehicle.display();
  }
  path.update();
}
