
Vehicle predator;
Vehicle prey;

void setup() {
  size(640, 360);
  predator = new Vehicle(new PVector(random(width), random(height)));
  prey = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  prey.wander();
  predator.wander();
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
