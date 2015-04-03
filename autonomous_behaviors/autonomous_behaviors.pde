
Vehicle predator;
Vehicle prey;

void setup() {
  size(640, 360);
  predator = new Vehicle(new PVector(random(width), random(height)));
  prey = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  // border for avoiding window edges
  rect(50, 50, width - 100, height - 100);
  
  prey.wander();
  predator.wander();
  
  prey.avoidEdges();
  predator.avoidEdges();
  
//  float dist = PVector.sub(predator.loc, prey.loc).mag();
//  predator.maxForce = map(dist, 0, width, 2, 0);
//  prey.maxSpeed = map(dist, 0, width, 4, 0);
//  if ( dist <= 100) {
//    prey.flee(predator.loc);
//    predator.pursue(prey.loc, prey.vel);  
//  } else {
//    PVector cursor = new PVector(mouseX, mouseY);
//    prey.arrive(cursor);
//    predator.arrive(cursor); 
//  }
   
  
  prey.update();
  predator.update();
  
  prey.display();
  predator.display();
}
