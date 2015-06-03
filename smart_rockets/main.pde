Population pop;
Obstacle[] obs;

void setup() {
  size(640, 480);
  pop = new Population(100);
  obs = new Obstacle[2];
  for (int n = 0; n < obs.length; n++) {
    obs[n] = new Obstacle(new PVector(random(20, width - 250), random(50, height - 250)), random(10, 200), random(10, 200));
  }
}

void draw() {
  textSize(16);
  background(175);
  for (Obstacle ob : obs) { ob.display(); }
  
  if (pop.lifeCounter < pop.lifeSpan) {
    pop.live();
    fill(0, 102, 153);
    text("generation: " + pop.generation, 10, 60);
    text("remaining cycles: " + (pop.lifeSpan - pop.lifeCounter), 10, 80);
    text("average fitness: " + pop.prevAve, 10, 100);
    text("best fitness: " + pop.prevBest, 10, 120);
  } else {
    pop.evolve();
  }
}
