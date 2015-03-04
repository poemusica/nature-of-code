import java.util.Iterator;

ArrayList<ParticleSystem> pSystems;

ParticleSystem mousePS;
PVector gravity;
PVector emitter;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  pSystems = new ArrayList<ParticleSystem>();
  emitter = new PVector(width/2, height/2);
  mousePS = new ParticleSystem(emitter);
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  emitter = new PVector(mouseX, mouseY);
  mousePS.origin.set(emitter);
  mousePS.run();
  
  for (ParticleSystem pSystem : pSystems) {
    pSystem.run();
  } 
}

void mouseClicked() {
  emitter = new PVector(mouseX, mouseY);
  pSystems.add(new ParticleSystem(emitter));
}
