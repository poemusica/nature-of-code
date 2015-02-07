Mover[] movers;
Liquid liquid;
PVector gravity;

void setup() {
  size(640, 360);
  
  gravity = new PVector(0, 0.1);
  liquid = new Liquid();
  movers = new Mover[10];
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0, width), 0);
  }
}

void draw() {
  background(255);
  liquid.display();
  for(int i = 0; i < movers.length; i++) {
    Mover m = movers[i];
    if (m.isInside(liquid) == true) {
      PVector drag = liquid.calcDrag(m);
      m.applyForce(drag);
    }
    m.applyForce(PVector.mult(gravity, m.mass));
    
    m.update();
    m.checkEdges();
    m.display();
  }
}


