Bob b;

void setup() {
  size(640, 360);
  b = new Bob();
}

void draw() {
  background(200);
  b.update();
  b.display();
}
