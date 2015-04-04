class FlowField {
  PVector[][] field;
  int rows, cols;
  float resolution;
  
  FlowField() {
    resolution = min(width, height) * 0.1;
    rows = floor(height / resolution);
    cols = floor(width / resolution);
    field = new PVector[rows][cols]; // 2D array
    
    for (int r = 0; r < rows; r++) {
      for(int c = 0; c < cols; c++) {
        field[r][c] = PVector.random2D();
      }
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
        ellipse(0, 0, 2, 2);
        line(-size/2, 0, size/2, 0);
        translate(size/2, 0);
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
