CantorList cantors;

void setup() {
  size(900, 360);
  CantorLine line = new CantorLine(10, 20, width - 20, 10);
  cantors = new CantorList(line, 5);
}

void draw() {
  background(255);
  strokeCap(SQUARE);
  cantors.display();
}
