import java.util.Iterator;

ArrayList<ParticleSystem> pSystems;

ParticleSystem mousePS;
PVector gravity;
PVector emitter;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  pSystems = new ArrayList<ParticleSystem>();
  mousePS = new ParticleSystem(new PVector(mouseX, mouseY));
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  mousePS.origin.set(new PVector(mouseX, mouseY));
  mousePS.run();
  
  for (ParticleSystem pSystem : pSystems) {
    pSystem.run();
  } 
}

void mouseClicked() {
  pSystems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
