import java.util.Iterator;

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
  
  Iterator<Particle> iter = particles.iterator();
  
  while (iter.hasNext()) {
    Particle p = iter.next();
    p.run();
    if (p.isDead()) {
      iter.remove();
    }
  }
}
