float theta;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  theta = map(mouseX, 0, width, 0, PI/2);
  translate(width/2, height);
  stroke(0);
  branch(60);
}

void branch(float len) {
  line(0, 0, 0, -len);
  
  if (len > 15) {
    translate(0, -len);
    len *= 0.66;
    pushMatrix();
    rotate(theta);
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    branch(len);
    popMatrix();
  }
}
