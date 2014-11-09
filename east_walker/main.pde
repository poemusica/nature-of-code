// GLOBALS
EastWalker ew;
MouseWalker mw;

void setup(){
  size(640, 360);
  ew = new EastWalker();
  mw = new MouseWalker();
  
  background(255);
}

void draw(){
  ew.step();
  ew.display();
  
  mw.step();
  mw.display();
}
