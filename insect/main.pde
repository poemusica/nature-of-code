Insect insect;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  insect = new Insect();
}

void draw() {
  background(210);
  insect.display();
}
