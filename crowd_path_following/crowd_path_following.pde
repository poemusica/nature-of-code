class Path {
  PVector[] points;
  int numPts;
  float w, spacing;
  
  Path() {
    numPts = (int) random(2, 25);
    w = 50;
    points = new PVector[numPts];
    spacing = width/round(numPts/2.0 + 1);
    for (int i = 0; i < numPts/2; i++) {
      PVector point = new PVector(spacing * (i + 1), random(w, (height/2)-w));
      points[i] = point;
    }
    for (int i = numPts/2; i < numPts; i++) {
      PVector point = new PVector(spacing * (numPts - i), random((height/2)+w, height-w));
      points[i] = point;
    }
  }
  
  PVector getFirst() {
    return points[0];
  }
  
  PVector getLast() {
    return points[numPts - 1];
  }
  
  void update() {
    for (int i = 0; i < numPts; i++) {
      float y = random(0, 1);
//      float y = noise(i, frameCount/100);
      if (i < numPts/2) {
        y = map(y, 0, 1, w, (height/2) - w);
      } else { 
        y = map(y, 0, 1, (height/2) + w, height - w);
      }
      points[i].y = y;
    }
  }
  
  void display() {
    // path width
    strokeWeight(w);
    stroke(0, 100);
    noFill();
    strokeCap(ROUND);
    beginShape();
    for (PVector v : points) { vertex(v.x, v.y); }
    endShape(CLOSE);
    // exact path with points
    strokeWeight(1);
    stroke(0);
    beginShape();
    for (PVector v : points) { vertex(v.x, v.y); ellipse(v.x, v.y, 2, 2); }
    endShape(CLOSE);
  }
}
