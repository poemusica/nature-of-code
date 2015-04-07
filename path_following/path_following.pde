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
//      PVector point = new PVector(spacing * i, random(height)); // doesn't handle this well yet
      PVector point = new PVector(spacing * i, map(noise(i * 0.25), 0, 1, 0, height));
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
    for (int i = 0; i < points.length; i++) {
      points[i].y = map(noise(i * 0.25, frameCount/100), 0, 1, 0, height);
    }
  }
  
  void display() {
    strokeWeight(w);
    stroke(0, 100);
    noFill();
    strokeCap(ROUND);
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    
    strokeWeight(1);
    stroke(0);
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape();
    fill(0);
    ellipse(points[0].x, points[0].y, 5, 5);
    ellipse(points[numPts - 1].x, points[numPts - 1].y, 5, 5);
  }
}
