Insect insect;

void setup() {
  size(800, 600);
  rectMode(CENTER);
  insect = new Insect();
}

void draw() {
  background(210);
  insect.update();
  insect.display();
}
