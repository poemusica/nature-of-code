class Population {
  DNA[] population = new DNA[100];
  float mutationRate = 0.01;
  int generation = 0;
  
  Population() {
    for (int n = 0; n < population.length; n++) {
      population[n] = new DNA();
    }
  }
  
  void evaluateFitness() {
    for (DNA dna : population) {
      dna.evaluate();
    }
  }
  
  float totalFitness() { // must call dna.evaluate() first
    float totalFitness = 0;
    for (DNA dna : population) {
      totalFitness += dna.fitness;
    }
    return totalFitness;
  }
  
  float averageFitness() { // must call dna.evaluate() first
    return totalFitness() / population.length;
  }
  
  void evolve() {
    // normalize fitness
    float total = totalFitness();
    for (DNA dna : population) {
      dna.normalize(total);
    }
    // select mating pairs
    DNA[][] mates = new DNA[population.length][2];
    for (int n = 0; n < population.length; n++) {
      mates[n] = selectMates();
    }
    // reproduce
    DNA[] offspring = new DNA[population.length];
    for (int n = 0; n < offspring.length; n++) {
      offspring[n] = reproduce(mates[n]);
    }
    // replace
    population = offspring;
    generation += 1;
  }
  
  DNA[] selectMates() {
    DNA[] mates = new DNA[2];
    int count = 0;
    int n = 0;
    while (count < 2) {
      DNA dna = population[n];
      if (random(100) <= dna.normFitness) {
        if (count == 0 || mates[0] != dna) {
          mates[count] = dna;
          count += 1;
        }
      }
      n = (n+1) % population.length;
    }
    return mates;
  }
  
  DNA reproduce(DNA[] mates) {
    DNA parentA = mates[0];
    DNA parentB = mates[1];
    DNA child = parentA.crossover(parentB);
    child.mutate(mutationRate);
    return child;
  }
  
  DNA findWinner() {
    DNA winner = population[0];
    for (DNA dna : population) {
      if (dna.fitness > winner.fitness) {
        winner = dna;
      }
    }
    return winner;
  }
}
