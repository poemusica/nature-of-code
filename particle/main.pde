ArrayList<Particle> particles;
PVector gravity;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  particles = new ArrayList<Particle>();
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  
  particles.add(new Particle());
  
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
