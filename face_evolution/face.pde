class Face {
  DNA dna;
  float x, y, score, fitness, normFitness;
  float faceSize, eyeSize, mouthWidth, mouthHeight;
  PVector eyeLeft, eyeRight, mouthLoc;
  color faceColor, eyeColor, mouthColor;
  
  Face(float _x) {
    x = _x;
    y = height/2;
    score = 1;
    fitness = 1;
    dna = new DNA(19);
    faceSize = map(dna.genes[0], 0, 1, 50, 100);
    faceColor = color(map(dna.genes[1], 0, 1, 0, 255), map(dna.genes[2], 0, 1, 0, 255), map(dna.genes[3], 0, 1, 0, 255));
    eyeSize = map(dna.genes[4], 0, 1, 2, 25);
    eyeColor = color(map(dna.genes[5], 0, 1, 0, 255), map(dna.genes[6], 0, 1, 0, 255), map(dna.genes[7], 0, 1, 0, 255));
    mouthWidth = map(dna.genes[8], 0, 1, 0, faceSize);
    mouthHeight = map(dna.genes[9], 0, 1, 0, 20);
    mouthColor = color(map(dna.genes[10], 0, 1, 0, 255), map(dna.genes[11], 0, 1, 0, 255), map(dna.genes[12], 0, 1, 0, 255));
    eyeLeft = new PVector(map(dna.genes[13], 0, 1, -1, -25), map(dna.genes[14], 0, 1, -50, 0));
    eyeRight = new PVector(map(dna.genes[15], 0, 1, 1, 25), map(dna.genes[16], 0, 1, -50, 0));
    mouthLoc = new PVector(map(dna.genes[17], 0, 1, -faceSize/2, faceSize/2), map(dna.genes[18], 0, 1, 0, faceSize/2));
  }
  
  boolean fContains(PVector v) {
    if (v.x > x - 50 && v.x < x + 50 && v.y > height/2 - 50 && v.y < height/2 + 50) {
      return true;
    }
    return false;
  }
  
  boolean isInsideFace(PVector v) {
    boolean result;
    float d = v.mag();
    if (d < faceSize/2) {
      result = true;
    } else {
      result = false;
    }
    return result;
  }
  
  void evaluate() {
    int n = 1;
    fitness += score * 10;
    if (isInsideFace(eyeLeft)) { n += 100;}
    if (isInsideFace(eyeRight)) { n += 100;}
    if (isInsideFace(mouthLoc)) {n += 100; } // upper left
    PVector v = PVector.add(mouthLoc, new PVector(0, mouthHeight)); // lower left
    if (isInsideFace(v)) { n += 100; }
    v = PVector.add(mouthLoc, new PVector(mouthWidth, 0)); // upper right
    if (isInsideFace(v)) { n += 100; }
    v = PVector.add(mouthLoc, new PVector(mouthWidth, mouthHeight)); // lower right 
    if (isInsideFace(v)) { n += 100; }
    v = PVector.add(mouthLoc, new PVector(mouthWidth/2, mouthHeight/2));
    float dLeft = PVector.dist(v, eyeLeft);
    float dRight = PVector.dist(v, eyeRight);
    if (dLeft > max(eyeSize, mouthWidth, mouthHeight)) { n += 100; }
    if (dRight > max(eyeSize, mouthWidth, mouthHeight)) { n += 100; }
    float eyeD = PVector.dist(eyeLeft, eyeRight);
    if ( eyeD >= eyeSize && eyeD <= faceSize) { n += 500; }
    fitness += n;
  }
  
  void normalize(float totalFitness) {
    normFitness = (fitness/totalFitness) * 100;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(faceColor);
    ellipseMode(CENTER);
    ellipse(0, 0, faceSize, faceSize);
    fill(eyeColor);
    ellipse(eyeLeft.x, eyeLeft.y, eyeSize, eyeSize);
    ellipse(eyeRight.x, eyeRight.y, eyeSize, eyeSize);
    fill(mouthColor);
    rectMode(CORNER);
    rect(mouthLoc.x, mouthLoc.y, mouthWidth, mouthHeight);
    popMatrix();
  }
}
