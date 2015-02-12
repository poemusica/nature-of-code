float x, y, r, theta;

void setup() {
  size(360, 360);
  x = width/2;
  y = height/2;
  r = 0;
  theta = 0;
}

void draw() {
  strokeWeight(2);
  stroke(175);
  r += 0.1;
  theta += 1;
  y = r * sin(theta);
  x = r * cos(theta);
  point(x, y);
  
}
