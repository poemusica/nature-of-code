import java.util.Iterator;

ParticleSystem ps;
PVector gravity;
PVector emitter;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  ps = new ParticleSystem();
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  emitter = new PVector(mouseX, mouseY);
  ps.origin.set(emitter);
  ps.run();
}
