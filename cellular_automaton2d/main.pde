CA ca;

void setup() {
  size(900, 600);
  ca = new CA();
}

void draw() {
  background(255);
  ca.run();
}

void keyPressed() { // press enter to start or clear the simulation
  if(key == ENTER || key == RETURN) {
    ca.running = !ca.running;
  }
  if(ca.running == false) { ca.clearCells(); }
}
