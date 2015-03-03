import java.util.Iterator;

ParticleSystem ps;
PVector gravity;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  ps = new ParticleSystem();
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  ps.run();
}
