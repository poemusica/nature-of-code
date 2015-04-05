void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  line(0, 0, 200, 0);
  float theta = map(mouseX, 0, width, 0, 360);
  text("deg: " + theta, 0, -150);
  text("rad: " + radians(theta), 0, -135);
  fill(0);
  arc(0, 0, 200, 200, 0, TWO_PI - radians(theta), PIE);
  rotate(TWO_PI - radians(theta));
  line(0, 0, 200, 0);
}
