// GLOBALS
RandomWalker w;
SWWalker sww;

void setup(){
  size(640, 360);
  w = new RandomWalker();
  sww = new SWWalker();
  background(255);
}

void draw(){
  w.step();
  w.display();
  
  sww.step();
  sww.display();
}
