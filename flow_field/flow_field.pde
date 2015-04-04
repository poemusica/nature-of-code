class FlowField {
  PVector[][] field;
  int rows, cols;
  float resolution;
  
  FlowField() {
    resolution = min(width, height) * 0.1;
    rows = floor(height / resolution);
    cols = floor(width / resolution);
    field = new PVector[rows][cols]; // 2D array
    
    float ystep = 0;
    for (int r = 0; r < rows; r++) {
      float xstep = 0;
      for(int c = 0; c < cols; c++) {
        PVector v = new PVector(map(c, 0, cols, 1, -1), map(r, 0, rows, 1, -1));
        v.normalize();
        field[r][c] = v;
//        float theta = map(noise(xstep, ystep), 0, 1, -PI, PI);
//        field[r][c] = new PVector(1, 0);
//        field[r][c].rotate(theta);
        xstep += 0.1;
      }
      ystep += 0.1;
    }
  }
  
  void display() {
    float centering = resolution/2;
    float size = resolution * 0.75;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        pushMatrix();
        translate(resolution * c + centering, resolution * r + centering);
        rotate(field[r][c].heading());
        fill(0);
        // cell center
        ellipse(0, 0, 2, 2);
        // arrow body
        line(-size/2, 0, size/2, 0);
        translate(size/2, 0);
        // arrow head
        pushMatrix();
        rotate(-PI * 5/6);
        line(0, 0, size/3, 0);
        popMatrix();
        pushMatrix();
        rotate(PI * 5/6);
        line(0, 0, size/3, 0);
        popMatrix();
        popMatrix();
      }
    }
  }
}
