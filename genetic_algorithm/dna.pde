class DNA {
  char[] genes = new char[18];
  float fitness;
  float normFitness;
  
  DNA() {
    for (int n = 0; n < genes.length; n++) {
      genes[n] = (char)random(32, 128);
    }
  }
  
  String geneString() {
    return new String(genes);
  }
  
  void evaluate() {
    int score = 0;
    for (int n = 0; n < target.length(); n++) {
      char c = target.charAt(n);
      if (genes[n] == c) {
        score++;
      }
    }
    fitness = pow(2, float(score)) / pow(2, target.length()); ;//float(score)/target.length();
  }
  
  void normalize(float totalFitness) {
    normFitness = (fitness/totalFitness) * 100;
  }
  
  DNA crossover(DNA partner) {
    DNA child = new DNA();
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
        genes[n] = (char)random(32, 128);
      }
    }
  }
  
}
