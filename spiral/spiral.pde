float x, y, r, theta;

void setup() {
  size(360, 360);
  x = width/2;
  y = height/2;
  r = 0;
  theta = 0;
}

void draw() {
  fill(0);
  r += 0.05;
  theta += 0.01;
  translate(width/2, height/2);
  x = r * cos(theta);
  y = r * sin(theta);
  ellipse(x, y, 16, 16);
  
}
