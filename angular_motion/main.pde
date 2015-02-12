Mover m;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  
  m = new Mover();
}

void draw() {
  background(210);
  m.update();
  m.display();
}
