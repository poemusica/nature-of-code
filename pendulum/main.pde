Pendulum pen;
float gravity;

void setup() {
  size(640, 360);
  gravity = 0.4;
  pen = new Pendulum();
}

void draw() {
  background(210);
  pen.update();
  pen.display();
}
