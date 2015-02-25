Pendulum pen, q, r;
float gravity;

void setup() {
  size(640, 360);
  gravity = 0.4;
  PVector v = new PVector(width/2, 0);
  pen = new Pendulum(v, 100, 45);
  q = new Pendulum(pen.bob, 100, 60);
  r = new Pendulum(q.bob, 100, 90);
}

void draw() {
  background(210);
  pen.update();
  pen.display();
  q.update();
  q.display();
  r.update();
  r.display();
}
