FlowField flowfield;
Vehicle vehicle;

void setup() {
  size(879, 654);
  rectMode(CENTER);
  flowfield = new FlowField();
  vehicle = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  flowfield.update();
  flowfield.display();
  PVector force = flowfield.lookup(vehicle.loc);
  force.setMag(vehicle.maxSpeed);
  vehicle.applyForce(force);
  vehicle.update();
  vehicle.wrap();
  vehicle.display();
}
