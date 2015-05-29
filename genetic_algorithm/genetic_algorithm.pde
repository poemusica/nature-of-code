DNA[] population;
String target;
String best;
int count;

void setup() {
  size(640, 360);
  population = new DNA[100];
  target = "to be or not to be";
  best = "";
  for (int n = 0; n < population.length; n++) {
    population[n] = new DNA();
  }
}

void draw() {
  best = findWinner().geneString();
  float totalFitness = 0;
  for (DNA dna : population) {
    dna.evaluate();
    totalFitness += dna.fitness;
  }
  float aveFitness = (totalFitness / population.length) * 100;
  if (!best.equals(target)) { 
    // normalize fitness
    for (DNA dna : population) {
      dna.normalize(totalFitness);
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
    count += 1;
  }
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
  text("generations: " + count, 10, 160);
  text("average fitness: " + aveFitness + "%", 10, 180);
  text("mutation rate: " + findWinner().mutationRate * 100 + "%", 10, 200);
}


DNA findWinner() {
  float topScore = 0;
  DNA winner = population[0];
  for (DNA dna : population) {
    if (dna.fitness > topScore) {
      topScore = dna.fitness;
      winner = dna;
    }
  }
  return winner;
}

DNA[] selectMates() {
  DNA[] mates = new DNA[2];
  int count = 0;
  int n = 0;
  while (count < 2) {
    DNA dna = population[n];
    if (random(100) <= dna.fitness) {
      if (count < 1 || mates[0] != dna) {
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
  child.mutate();
  return child;
}

