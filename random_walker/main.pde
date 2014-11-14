// GLOBALS
RandomWalker w;
SWWalker sww;
EastWalker ew;
MouseWalker mw;

void setup(){
  size(640, 360);
  w = new RandomWalker();
  sww = new SWWalker();
  ew = new EastWalker();
  mw = new MouseWalker();
  
  background(255);
}

void draw(){
  w.step();
  w.display();
  
  sww.step();
  sww.display();
  
  ew.step();
  ew.display();
  
  mw.step();
  mw.display();
}
