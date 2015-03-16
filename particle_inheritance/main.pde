import java.util.Iterator;

PVector gravity;
ParticleSystem ps;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  gravity = new PVector(0, 0.1);
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  background(210);
  ps.run();
}
