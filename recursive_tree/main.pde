Tree tree;
float ang;

void setup() {
  size(640, 360);
  tree = new Tree(100, 4);
  ang = PI/6; //default
}

void draw() {
  background(255);
  translate(width/2, height);
  ang = map(mouseX, 0, width, 0, PI/2);
  tree.recalc();
  tree.display();
}
