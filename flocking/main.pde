Flock flock;
Boid debugBoid;
UI controls;

void setup() {
  size(1280, 640);
  flock = new Flock();
  debugBoid = flock.boids.get(0);
  debugBoid.col = color(0, 255, 0);
  controls = new UI();
  controls.addSlideData(flock.view);
  controls.addSlideData(flock.sep);
  controls.addSlideData(flock.coh);
  controls.addSlideData(flock.ali);
  controls.addSlideData(flock.wander);
  controls.addSlideData(flock.maxSpeed);
  controls.addSlideData(flock.maxForce);
  controls.addSlideData(flock.range);
  controls.addSlideData(flock.sepRange);
  controls.addSlideData(flock.cohRange);
  controls.addSlideData(flock.aliRange);
  controls.addPieData(flock.angRange);
  controls.addPieData(flock.angView);
  controls.addPieData(flock.shape);
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
