class FlowField {
  PVector[][] field;
  int rows, cols;
  float resolution, xmargin, ymargin;
  
  FlowField() {
    resolution = 50;
    rows = floor(height/resolution);
    cols = floor(width/resolution);
    field = new PVector[rows][cols]; // 2D array
    xmargin = (width - (cols * resolution) + resolution)/2;
    ymargin = (height - (rows * resolution) + resolution)/2;
    
    update();
  }
  
  PVector lookup(PVector v) {
    int row = constrain(round((v.y - ymargin)/resolution), 0, rows - 1);
    int col = constrain(round((v.x - xmargin)/resolution), 0, cols - 1);
    return field[row][col].get();
  }
  
  void update() {
    float ystep = 0;
    for (int r = 0; r < rows; r++) {
      float xstep = 0;
      for(int c = 0; c < cols; c++) {
        float theta = map(noise(xstep, ystep, frameCount/100.0 ), 0, 1, 1, TWO_PI);
        field[r][c] = new PVector(1, 0);
        field[r][c].rotate(theta);
        xstep += 0.1;
      }
      ystep += 0.1;
    }
  }
  
  void display() {
    float size = resolution * 0.75;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        pushMatrix();
        translate(resolution * c + xmargin, resolution * r + ymargin);
        rotate(field[r][c].heading());
        fill(0);
        pushStyle();
        if (lookup(vehicle.loc).equals(field[r][c])) {
          fill(255, 0, 0);
          stroke(255, 0, 0);
        }
        // cell center
        ellipse(0, 0, 5, 5);
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
        popStyle();
        popMatrix();
      }
    }
  }
}
