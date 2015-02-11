Baton b;
int c;

void setup() {
  size(360, 140);
  b = new Baton();
  c = 1;
}

void draw() {
  background(255);
  b.display();
}
