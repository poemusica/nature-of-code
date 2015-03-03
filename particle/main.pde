Particle p;
PVector gravity;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  p = new Particle();
  gravity = new PVector(0, 2); 
}

void draw() { 
  background(255);
  p.run();
}
