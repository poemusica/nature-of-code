ArrayList<Vehicle> vehicles;

void setup() {
  size(640, 360);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 50; i++) {
    vehicles.add(new Vehicle(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(255);
  for (Vehicle v : vehicles) {
    v.applyBehaviors(vehicles);
    v.update();
    v.display();
  }
}

void mouseDragged() {
  vehicles.add(new Vehicle(new PVector(mouseX, mouseY)));
}
