Mover[] movers;
float G;

void setup(){
  size(1200, 700);
  background(0);
  G = 0.4;
  movers = new Mover[10];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw(){
  background(0);
  Mover m, a;
  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    for (int j = 0; j < movers.length; j++) {
      a = movers[j];
      if (i != j) {
        m.applyForce(a.attract(m));
      }
    }
    m.update();
    m.display();
  }
  
}
