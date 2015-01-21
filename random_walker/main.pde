// GLOBALS
RandomWalker w;
SWWalker sww;
EastWalker ew;
MouseWalker mw;
GaussianWalker gw;
CustomWalker cw;
PerlinWalker pw;
PerlinStepper ps;

void setup(){
  size(640, 360);
  w = new RandomWalker();
  sww = new SWWalker();
  ew = new EastWalker();
  mw = new MouseWalker();
  gw = new GaussianWalker();
  cw = new CustomWalker();
  pw = new PerlinWalker();
  ps = new PerlinStepper();
  
  background(255);
  strokeWeight(2);
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
  
  gw.step();
  gw.display();
  
  cw.step();
  cw.display();
  
  pw.step();
  pw.display();
  
  ps.step();
  ps.display();
}
