Wave w, v;

void setup(){
  size(640, 360);
  w = new Wave(random(width), random(height));
  v = new Wave(random(width), random(height));
}

void draw(){
  background(210);
  w.update();
  w.displayFixedHead();
  
  v.update();
  v.displayHeadBob();
}
