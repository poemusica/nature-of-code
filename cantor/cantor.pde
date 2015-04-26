float weight;

void setup() {
  size(900, 360);
}

void draw() {
  background(255);
  strokeCap(SQUARE);
  cantor(10, 20, width - 20, 10);
}

void cantor(float x, float y, float len, float weight) {
  if ( len >= 1) {
    strokeWeight(weight);
    line(x, y, x + len, y);
    y += 20;
    weight -= 1.5;
    weight = constrain(weight, 1, 10);
    cantor(x, y, len/3, weight);
    cantor(x + len * 2/3, y, len/3, weight);
  }
}
