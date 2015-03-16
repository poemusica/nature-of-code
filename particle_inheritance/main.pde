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
  ps.applyForce(new PVector(map(noise(frameCount/100), 0, 1, -0.05, 0.05), map(noise(millis()), 0, 1, -0.05, 0.05)));
  ps.run();
}
