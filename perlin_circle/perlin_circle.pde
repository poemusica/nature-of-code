float t;

void setup(){
  size(640, 320);
  t = 0;
}

void draw(){
  float x = random(0, width);
  stroke(205);
  fill(255, 0, 255, 90);
  ellipse(x, 180, 16, 16);
  
  fill(0, 255, 255, 90);
  float n = noise(t);
  float m = map(n, 0, 1, 0, width);
  ellipse(m, 200, 16, 16);
  t += 0.01;
}
