//Change the attraction force in Example 2.8 to a repulsion force.
//Can you create an example in which all of the Mover objects are 
//attracted to the mouse, but repel each other? Think about how 
//you need to balance the relative strength of the forces and how
//to most effectively use distance in your force calculations.

Mover[] movers;
Attractor attractor;
float G;

void setup() {
  size(1200, 700);
  G = 1;
  attractor = new Attractor();
  movers = new Mover[10];
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(175);
  Mover m, r;
  attractor.update();
  
  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    for (int j = 0; j < movers.length; j++) {
      r = movers[j];
      if (i != j) {
        m.applyForce(r.repel(m));
      }
    }
    m.applyForce(attractor.attract(m));
    m.update();
    m.display();
  }
  
  attractor.display();
}
