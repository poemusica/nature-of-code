ArrayList<Boid> boids;

void setup() {
  size(720, 360);
  boids = new ArrayList<Boid>();
  for (int i = 0; i < 50; i++) {
    boids.add(new Boid(new PVector(random(width), random(height))));
  }
}

void draw() {
  background(255);
  for (Boid b : boids) {
    b.applyBehaviors(boids);
    b.update();
    b.wrap();
    b.display();
  }
}

void mouseDragged() {
  boids.add(new Boid(new PVector(mouseX, mouseY)));
}
