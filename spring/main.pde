Spring spring;
Mover bob;
PVector gravity;

void setup() {
  size(640, 360);
  spring = new Spring();
  bob = new Mover();
  gravity = new PVector(0, 0.05);
}

void draw() {
  background(210);
  translate(width/2, 0);
  
  PVector f = spring.springForce(bob);
  bob.applyForce(f);
  bob.applyForce(gravity);
  if (mousePressed) {
    PVector wind = new PVector(map(noise(mouseX/100), 0, 1, -0.01, 0.01), map(noise(mouseY/100), 0, 1, -0.01, 0.01));
    bob.applyForce(wind);
  }
  bob.update();
  spring.connect(bob);
  bob.display();
}
