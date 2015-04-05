FlowField flowfield;
Vehicle vehicle;

void setup() {
  size(654, 879);
  rectMode(CENTER);
  flowfield = new FlowField();
  vehicle = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  flowfield.display();
  PVector force = flowfield.lookup(vehicle.loc);
  force.setMag(vehicle.maxSpeed);
  vehicle.applyForce(force);
  vehicle.update();
  vehicle.wrap();
  vehicle.display();
}
