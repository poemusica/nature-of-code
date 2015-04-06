class Path {
  PVector start, end;
  float w;
  
  Path() {
    w = 50;
    start = new PVector(100, random(height - 0));
    end = new PVector(width - 100, random(height - 0));
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
