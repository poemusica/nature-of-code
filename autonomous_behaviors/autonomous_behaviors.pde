
Vehicle predator;
Vehicle prey;

void setup() {
  size(1080, 800);
  predator = new Vehicle(new PVector(random(width), random(height)));
  prey = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  // border for avoiding window edges
  rect(50, 50, width - 100, height - 100);
  
  float dist = PVector.sub(predator.loc, prey.loc).mag();
  predator.maxForce = map(dist, 0, width, 2, 0);
  predator.maxSpeed = map(dist, 0, width, 6, 0);
  prey.maxSpeed = map(dist, 0, width, 4, 0);
  
  if ( dist <= 300) {
    prey.flee(predator.loc);
  } else {
    prey.wander();
  }
  
  predator.orbit(prey.loc);
   
  prey.avoidEdges();
  predator.avoidEdges();
  
  prey.update();
  predator.update();
  
  prey.display();
  predator.display();
}
