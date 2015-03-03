ArrayList<Particle> particles;
PVector gravity;

void setup() {
  size(640, 320);
  rectMode(CENTER);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 10; i++) {
    particles.add(new Particle());
  }
  gravity = new PVector(0, 0.1); 
}

void draw() { 
  background(255);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
  }
}
