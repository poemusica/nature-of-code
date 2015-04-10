Flock flock;
Boid debugBoid;

void setup() {
  size(720, 360);
  flock = new Flock();
  debugBoid = flock.boids.get(0);
}

void draw() {
  background(255);
  debugBoid.debug(flock.boids);
  flock.run();
}

void mouseDragged() {
  Boid b = new Boid(new PVector(mouseX, mouseY));
  flock.addBoid(b);
}
