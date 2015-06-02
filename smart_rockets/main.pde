Population pop;

void setup() {
  size(640, 480);
  pop = new Population(100);
}

void draw() {
  textSize(16);
  background(175);
  
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
