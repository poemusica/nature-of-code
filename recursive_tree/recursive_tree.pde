float theta;

void setup() {
  size(640, 360);
  theta = PI/6; //default value
}

void draw() {
  background(255);
  theta = map(mouseX, 0, width, 0, PI/2);
  translate(width/2, height);
  stroke(0);
  branch(60, 4);
}

void branch(float len, float weight) {
  strokeWeight(weight);
  line(0, 0, 0, -len);
  
  if (len > 5) {
    translate(0, -len);
    len *= 0.66;
    weight *= 0.66;
    pushMatrix();
    rotate(theta);
    branch(len, weight);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    branch(len, weight);
    popMatrix();
  }
}
