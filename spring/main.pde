Spring s;
Spring spring;
Mover b;
Mover p;
PVector gravity;

void setup() {
  size(640, 360);
  b = new Mover();
  p = new Mover();
  s = new Spring(0, 0);
  spring = new Spring(b.loc.x, b.loc.y);
  gravity = new PVector(0, 0.05);
}

void draw() {
  background(210);
  translate(width/2, 0);
  
  s.connect(b);
  spring.update(b);
  spring.connect(p);
  b.update();
  b.display();
  p.update();
  p.display();
}
