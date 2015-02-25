//Create an example that simulates a box sliding down the incline with friction. 
//Note that the magnitude of the friction force is equal to the normal force.
PVector gravity, friction;
float g, incline;
Box b;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  incline = 15;
  g = 0.1;
  gravity = new PVector(0, g);
  b = new Box();
}

void draw() {
  background(210);
  pushMatrix();
  translate(0, height/2);
  rotate(radians(incline));
  line(0, 0, (sqrt(sq(width) + sq(height/2 ))), 0);
  popMatrix();

  
  friction = new PVector(0, (cos(radians(incline)) * -g));
  b.applyForce(friction);
  b.applyForce(gravity);
  b.update();
  b.display();
}
