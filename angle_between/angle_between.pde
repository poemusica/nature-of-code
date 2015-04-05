PVector m, v;
float len;

void setup() {
  size(640, 360);
  len = 150;
  m = new PVector();
  v = new PVector(len, 0);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  m.set(mouseX, mouseY);
  m.sub(new PVector(width/2, height/2));
  m.setMag(len);
  line(0, 0, v.x, v.y);
  line(0, 0, m.x, m.y);
  float theta = PVector.angleBetween(m, v);
  if (m.y >= 0 ) { theta = TWO_PI - theta; }
  text("deg: " + degrees(theta), 0, -150);
  text("rad: " + theta, 0, -135);
  fill(50);
  arc(0, 0, len, len, 0, TWO_PI - theta, PIE);
  noStroke();
  fill(150, 20, 10);
  arc(0, 0, len, len, TWO_PI - theta, TWO_PI, PIE);
}
