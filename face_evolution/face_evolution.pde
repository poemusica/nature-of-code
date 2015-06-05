class Population {
  Face[] population;
  float mutationRate;
  int generation;
  float ave, total, best;
  Face[] top;
  int topIndex;
  
  Population(int num) { 
    mutationRate = 0.01;
    generation = 0;
    population = new Face[num];
    for (int n = 0; n < population.length; n++) {
      population[n] = new Face(100 * (n+1));
    }
    ave = 0;
    total = 0;
    best = 0;
    top = new Face[num];
    topIndex = 0;
    for (int n = 0; n < top.length; n++) {
      top[n] = null;
    }
  }
  
  void userScore(PVector m) {
    for (Face face : population) {
      if (face.fContains(m)) {
        face.score += 1;
      }
    }
  }
  
  void evaluateFitness() {
    for (Face face : population) {
      face.evaluate();
    }
  }
  
  
  float totalFitness() { // must call face.evaluate() first
    float totalFitness = 0;
    for (Face face : population) {
      totalFitness += face.fitness;
    }
    return totalFitness;
  }
  
  float averageFitness() { // must call face.evaluate() first
    return totalFitness() / population.length;
  }
  
  void evolve() {
    // evaluate fitness
    evaluateFitness();
    
    // normalize fitness
    total = totalFitness();
    
    // average fitness
    ave = averageFitness();

    for (Face face: population) {
      face.normalize(total);
    }
    
    // check for perfect face
    seekPerfection();
    
    // select mating pairs
    Face[][] mates = new Face[population.length][2];
    for (int n = 0; n < population.length; n++) {
      mates[n] = selectMates();
    }
    
    // reproduce
    Face[] offspring = new Face[population.length];
    for (int n = 0; n < offspring.length; n++) {
      offspring[n] = reproduce(mates[n], n);
    }
    // replace
    population = offspring;
    generation += 1;
  }
  
  Face[] selectMates() {
    Face[] mates = new Face[2];
    int count = 0;
    int n = 0;
    while (count < 2) {
      Face face = population[n];
      if (random(100) <= face.normFitness) {
        if (count == 0 || mates[0] != face) {
          mates[count] = face;
          count += 1;
        }
      }
      n = (n+1) % population.length;
    }
    return mates;
  }
  
  Face reproduce(Face[] mates, int n) {
    Face parentA = mates[0];
    Face parentB = mates[1];
    Face child = new Face(100 * (n+1));
    child.dna = parentA.dna.crossover(parentB.dna);
    child.dna.mutate(mutationRate);
    return child;
  }
  
  void seekPerfection() {
    for (Face face : population) {
      if (face.fitness >= best) {
        best = face.fitness;
        top[topIndex] = face;
        face.x = 100 * (topIndex + 1);
        face.y = 50;
        topIndex = (topIndex + 1) % 7;
      }
    }
  }
  
  void display() {
    for (int n = 0; n < top.length; n++) {
      if (top[n] != null) {
          Face face = top[n];
          face.display();
      }
    }
    for (Face face : population) {
      face.display();
      fill(90);
      text(face.score, face.x - 25, face.y + 100);
    }
    fill(90);
    rectMode(CENTER);
    text("generation: " + generation, 30, 380);
    text("best: " + best, 30, 400);
    text("average: " + pop.ave, 30, 420);
    text("total: " + pop.total, 30, 440);
  }
}
