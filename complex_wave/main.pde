Wave a, b, c;

void setup(){
  size(640, 360);
  a = new Wave(height/4);
  b = new Wave(height * 3/4);
  c = new Wave(height/2);
}

void draw(){
  background(210);
  a.display();
  b.display();
  c.addWaves(a, b);
}
