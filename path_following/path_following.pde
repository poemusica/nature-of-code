class Path {
  PVector[] points;
  int numPts;
  float w, spacing;
  
  Path() {
    w = 50;
    numPts = 10;
    points = new PVector[numPts];
    spacing = width/(numPts - 1);
    for (int i = 0; i < points.length; i++) {
      PVector point = new PVector(spacing * i, random(height));
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
      points[i].y = random(0, height);
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
    endShape();
    // exact path
    strokeWeight(1);
    stroke(0);
    beginShape();
    for (PVector v : points) { vertex(v.x, v.y); ellipse(v.x, v.y, 2, 2); }
    endShape();
  }
}
