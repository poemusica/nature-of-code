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
  mousePS.lifespan = 300;
  mousePS.run();
  
  Iterator<ParticleSystem> iter = pSystems.iterator();
  while (iter.hasNext()) {
    ParticleSystem pSys = iter.next();
    pSys.run();
    if (pSys.isDead()) { iter.remove(); }
  } 
}

void mouseClicked() {
  pSystems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
