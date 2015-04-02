
Vehicle vehicle;

void setup() {
  size(640, 360);
  vehicle = new Vehicle(new PVector(width/2, height/2));
}

void draw() {
  background(255);
  vehicle.update();
  vehicle.display();
}
