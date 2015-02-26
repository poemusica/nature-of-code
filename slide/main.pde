//Create an example that simulates a box sliding down the incline with friction. 
//Note that the magnitude of the friction force is equal to the normal force.
PVector gravity, normal, friction;
float n, g, incline;
Box b;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  incline = 75;
  g = 0.1;
  gravity = new PVector(0, g);
  b = new Box();
}

void draw() {
  background(210);
  pushMatrix();
  translate(0, height/2);
  rotate(radians(incline));
  line(0, 0, 900, 0);
  popMatrix();

  normal = gravity.get();
  normal.mult(-1);
  normal.setMag(cos(radians(incline)) * g);
  normal.rotate(radians(incline));
  friction = b.vel.get();
  friction.setMag(cos(radians(incline)) * g);
  friction.mult(-0.09);
  
  b.applyForce(gravity);
  b.applyForce(normal);
  b.applyForce(friction);
 
  b.update();
  
  b.display();
}
