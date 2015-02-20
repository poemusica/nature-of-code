float x, y, r, theta;

void setup() {
  size(360, 360);
  frameRate(120);
  x = width/2;
  y = height/2;
  r = 0;
  theta = 0;
}

void draw() {
  fill(0);
  stroke(0);
  float n = map(noise(frameCount/10), 0, 1, -0.5, 0.5);
  println(n);
  r += n;
  theta += 0.01;
  translate(width/2, height/2);
  x = r * cos(theta);
  y = r * sin(theta);
  ellipse(x, y, 5, 5);
  
}
