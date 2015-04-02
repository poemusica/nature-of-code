
Vehicle predator;
Vehicle prey;

void setup() {
  size(640, 360);
  predator = new Vehicle(new PVector(random(width), random(height)));
  prey = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  
  if (PVector.sub(predator.loc, prey.loc).mag() < 100) {
    prey.flee(predator.loc);
    predator.pursue(prey);  
  } else {
    PVector cursor = new PVector(mouseX, mouseY);
    prey.seek(cursor);
    predator.seek(cursor); 
  }
   
  
  prey.update();
  predator.update();
  
  prey.display();
  predator.display();
}
