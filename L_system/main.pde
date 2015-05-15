LSystem Lsys;

void setup() {
  size(360, 460);
  Lsys = new LSystem(width/3, radians(25));
}

void draw() {
 background(#00062E); // navy
 translate(width/3, height);
 stroke(#CD2D2D); // coral
 Lsys.display(); 
}

void mouseClicked() {
  Lsys.generate(); 
}
