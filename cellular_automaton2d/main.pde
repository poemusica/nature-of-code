CA ca;

void setup() {
  size(900, 600);
  ca = new CA();
}

void draw() {
  background(255);
  ca.run();
}
