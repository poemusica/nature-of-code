Flock flock;
Boid debugBoid;
UI controls;

void setup() {
  size(720, 360);
  flock = new Flock();
  debugBoid = flock.boids.get(0);
  debugBoid.col.set(0, 255, 0);
  controls = new UI();
  controls.addSlideData(flock.view);
  controls.addSlideData(flock.sep);
  controls.addSlideData(flock.coh);
  controls.addSlideData(flock.ali);
  controls.addSlideData(flock.wander);
  controls.addSlideData(flock.maxSpeed);
  controls.addSlideData(flock.maxForce);
}

void draw() {
  background(255);
  debugBoid.debug(flock.boids);
  flock.run();
  controls.display();
}

void mouseClicked() {
  Boid b = new Boid(new PVector(mouseX, mouseY), flock);
  flock.addBoid(b);
}

void mouseDragged() {
  controls.update();
}
