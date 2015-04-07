class Path {
  PVector[] points;
  int numPts;
  float w;
  
  Path() {
    w = 50;
    numPts = 4;
    points = new PVector[numPts];
    float spacing = width/(numPts - 1);
    for (int i = 0; i < points.length; i++) {
      PVector point = new PVector(spacing * i, random(height));
      points[i] = point;
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
