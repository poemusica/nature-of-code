import java.util.Iterator;

float G;
PVector gravity;
ParticleSystem ps;
ArrayList<Repeller> repellers;

void setup() {
  size(640, 360);
  G = 0.1;
  gravity = new PVector(0, G);
  ps = new ParticleSystem(new PVector(width/2, height/2));
  repellers = new ArrayList<Repeller>();
}

void draw() {
  background(210);
  
  Iterator<Repeller> iter = repellers.iterator();
  while (iter.hasNext()) {
    Repeller r = iter.next();
    r.display();
    r.repel(ps);
  }
  ps.applyForce(gravity);
  ps.run();
}

void mouseClicked() {
  repellers.add(new Repeller(new PVector(mouseX, mouseY)));
}
