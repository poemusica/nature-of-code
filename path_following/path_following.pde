class Path {
  PVector start, end;
  float w;
  
  Path() {
    w = 50;
    start = new PVector(w/2, random(height - w/2));
    end = new PVector(width - w/2, random(height - w/2));
  }
  
  void display() {
    strokeWeight(w);
    stroke(0, 100);
    strokeCap(ROUND);
    line(start.x, start.y, end.x, end.y);
    strokeWeight(1);
    stroke(0);
    fill(0);
    line(start.x, start.y, end.x, end.y);
    ellipse(start.x, start.y, 5, 5);
    ellipse(end.x, end.y, 5, 5);
  }
}
