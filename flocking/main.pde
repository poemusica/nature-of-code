Flock flock;
Boid debugBoid;
UI controls;

void setup() {
  size(1280, 640);
  flock = new Flock();
  debugBoid = flock.boids.get(0);
  debugBoid.c = color(0, 255, 0);
  controls = new UI();
  color cyan = color(0, 255, 255);
  color green = color(0, 255, 0);
  color magenta = color(255, 0, 255);
  color yellow = color(255, 255, 0);
  color black = color(0, 0, 0);
  color gray = color(210, 210, 210);
  controls.addSlideWidget(new Widget(flock.view, controls.getSlideCoords(), cyan));
  controls.addSlideWidget(new Widget(flock.sep, controls.getSlideCoords(), green));
  controls.addSlideWidget(new Widget(flock.coh, controls.getSlideCoords(), magenta));
  controls.addSlideWidget(new Widget(flock.ali, controls.getSlideCoords(), yellow));
  controls.addSlideWidget(new Widget(flock.wander, controls.getSlideCoords(), black));
  controls.addSlideWidget(new Widget(flock.maxSpeed, controls.getSlideCoords(), black));
  controls.addSlideWidget(new Widget(flock.maxForce, controls.getSlideCoords(), black));
  controls.addSlideWidget(new Widget(flock.range, controls.getSlideCoords(), gray));
  controls.addSlideWidget(new Widget(flock.sepRange, controls.getSlideCoords(), green));
  controls.addSlideWidget(new Widget(flock.cohRange, controls.getSlideCoords(), magenta));
  controls.addSlideWidget(new Widget(flock.aliRange, controls.getSlideCoords(), yellow));
  controls.addPieWidget(new Widget(flock.angRange, controls.getPieCoords(), gray));
  controls.addPieWidget(new Widget(flock.angView, controls.getPieCoords(), cyan));
  controls.addPieWidget(new Widget(flock.shape, controls.getPieCoords(), flock.c));
}

void draw() {
  background(150);
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
