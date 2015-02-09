Mover[] movers;
Attractor[] attractors;

void setup(){
  size(640, 320);
  background(0);
  movers = new Mover[10];
  attractors = new Attractor[2];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor();
  } 
}

void draw(){
 
  Mover m;
  Attractor a;
  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    for (int j = 0; j < attractors.length; j++) {
      a = attractors[j];
      m.applyForce(a.attract(m));
    }
    m.update();
    m.display();
  }
  
}
