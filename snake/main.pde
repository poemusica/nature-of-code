Wave a, b, c;

void setup(){
  size(640, 360);
  a = new Wave(random(width), random(height));
}

void draw(){
  background(210);
  a.update();
  a.display();
}
