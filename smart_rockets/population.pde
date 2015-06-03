class Population {
  Rocket[] population;
  float mutationRate;
  int generation, lifeCounter, lifeSpan;
  float prevBestDist, prevAveDist, prevBestTime, prevAveTime;
  
  Population(int num) {
    mutationRate = 0.01;
    generation = 0;
    lifeCounter = 0;
    lifeSpan = 100;
    population = new Rocket[num];
    for (int n = 0; n < population.length; n++) {
      population[n] = new Rocket(lifeSpan);
    }
    
  }
  
  void live() {
    for (Rocket rocket : population) {
      rocket.run(lifeCounter);
    }
    lifeCounter++;
  }
  
  void evaluateFitness() {
    for (Rocket rocket : population) {
      rocket.evaluate(target.loc);
    }
  }
  
  void aveDist() {
    float total = 0;
    for (Rocket rocket : population) {
      total += rocket.record;
    }
    prevAveDist = total / population.length;
  }
  
  void bestDist() {
    prevBestDist = 100000;
    for (Rocket rocket : population) {
      if (rocket.record < prevBestDist) {
        prevBestDist = rocket.record;
      }
    }
  }
  
  void aveTime() {
    float total = 0;
    for (Rocket rocket : population) {
      total += rocket.finishTime;
    }
    prevAveTime = total / population.length;
  }
  
  void bestTime() {
    prevBestTime = 1000000000;
    for (Rocket rocket : population) {
      if (rocket.finishTime < prevBestTime) {
        prevBestTime = rocket.finishTime;
      }
    }
  }
  
  float totalFitness() { // must call rocket.evaluate() first
    float totalFitness = 0;
    for (Rocket rocket : population) {
      totalFitness += rocket.fitness;
    }
    return totalFitness;
  }
  
  void evolve() {
    // evaluate fitness
    evaluateFitness();
    
    // normalize fitness
    float total = totalFitness();
    bestDist();
    aveDist();
    bestTime();
    aveTime();
    for (Rocket rocket: population) {
      rocket.normalize(total);
    }
    // select mating pairs
    Rocket[][] mates = new Rocket[population.length][2];
    for (int n = 0; n < population.length; n++) {
      mates[n] = selectMates();
    }
    
    // reproduce
    Rocket[] offspring = new Rocket[population.length];
    for (int n = 0; n < offspring.length; n++) {
      offspring[n] = reproduce(mates[n]);
    }
    // replace
    population = offspring;
    generation += 1;
    lifeCounter = 0;
  }
  
  Rocket[] selectMates() {
    Rocket[] mates = new Rocket[2];
    int count = 0;
    int n = 0;
    while (count < 2) {
      Rocket rocket = population[n];
      if (random(100) <= rocket.normFitness) {
        if (count == 0 || mates[0] != rocket) {
          mates[count] = rocket;
          count += 1;
        }
      }
      n = (n+1) % population.length;
    }
    return mates;
  }
  
  Rocket reproduce(Rocket[] mates) {
    Rocket parentA = mates[0];
    Rocket parentB = mates[1];
    Rocket child = new Rocket(lifeSpan);
    child.dna = parentA.dna.crossover(parentB.dna);
    child.dna.mutate(mutationRate);
    return child;
  }
  
}
