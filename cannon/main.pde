Cannon c;
Box b;
PVector gravity;

void setup() {
  size(640, 360);
  c = new Cannon();
  b = new Box();
  gravity = new PVector(0, 0.15);
}

void draw() {
  background(245);
  if (b.onScreen() == false) {
    b.loc = c.loc.get();
    b.vel.set(0, 0);
    b.angvel = 0;
    PVector f = new PVector(10, -10);
    b.applyForce(f);
    b.applyRotation(0.05);
  }
  b.applyForce(gravity);
  b.update();
  b.display();
  c.display();
}
