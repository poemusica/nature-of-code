class DNA {
  PVector[] genes;
  float maxForce;
  
  DNA(int num) {
    maxForce = 0.3;
    genes = new PVector[num];
    for (int n = 0; n < genes.length; n++) {
      genes[n] = PVector.random2D();
      genes[n].mult(random(0, maxForce));
    }
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA(genes.length);
    int splicePt = (int)random(genes.length);
    for (int n = 0; n < genes.length; n++) {
      if (n < splicePt) {
        child.genes[n] = genes[n];
      } else {
        child.genes[n] = partner.genes[n];
      }
    }
    return child;
  }
  
  void mutate(float rate) {
    for (int n = 0; n < genes.length; n++) {
      if (random(1) < rate) {
        genes[n] = PVector.random2D();
        genes[n].mult(random(0, maxForce));
      }
    }
  }
}
