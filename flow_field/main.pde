FlowField flowfield;

void setup() {
  size(800, 400);
  flowfield = new FlowField();
}

void draw() {
  background(255);
  stroke(0);
  flowfield.display();
}
