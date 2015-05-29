Population pop;
String target;
String best;

void setup() {
  size(640, 360);
  pop = new Population();
  target = "to be or not to be";
  best = "";
}

void draw() {
  pop.evaluateFitness();
  best = pop.findWinner().geneString();
  
  
  background(175);
  textSize(18);
  fill(0, 102, 153);
  text("best phrase: ", 10, 60);
  textSize(26);
  fill(255);
  text(best, 10, 100);
  textSize(18);
  fill(0, 102, 153);
  text("target phrase: " + target, 10, 140);
  text("generations: " + pop.generation, 10, 160);
  text("average fitness: " + pop.averageFitness(), 10, 180);
  text("mutation rate: " + pop.mutationRate * 100 + "%", 10, 200);
  
  if (!best.equals(target)) {
    pop.evolve();
  }
}
