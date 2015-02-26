Spring spring;
Mover b;
Mover p;
PVector gravity;

void setup() {
  size(640, 360);
  b = new Mover();
  p = new Mover();
  spring = new Spring(b.loc.x, b.loc.y);
  gravity = new PVector(0, 0.05);
}

void draw() {
  background(210);
  translate(width/2, 0);
  spring.update(p); // sets anchor
  spring.constrainLen(b);
  spring.connect(b); // applies spring force
  b.update();
  
  spring.update(b); // sets anchor
  spring.constrainLen(p);
  spring.connect(p); // applies spring force
  p.update();
  
  spring.display(b);
  spring.display(p);
  fill(175);
  b.display();
  fill(255);
  p.display();
}
