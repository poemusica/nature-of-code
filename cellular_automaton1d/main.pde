CA ca;

void setup() {
  size(900, 600);
  background(255);
  ca = new CA();
}

void draw() {
  ca.run();
}
