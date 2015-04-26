void setup() {
  size(640, 360);
  strokeWeight(2);
  smooth();
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, 200);
}

void drawCircle(float x, float y, float radius) {
  float noiseVal = 0;
  pushMatrix();
  translate(x, y);
  beginShape();
  stroke(175, 75);
  fill(0, 255, 0, 10);
  for( float theta = 0; theta <= 360; theta++) {
    noiseVal += 0.1;
    float r = map(noise(noiseVal), 0, 1, -radius/3, radius/3);
    r += radius;
    float xPoint = radius * cos(radians(theta));
    float yPoint = radius * sin(radians(theta));
    curveVertex(xPoint, yPoint);
  }
  endShape(CLOSE);
  popMatrix();
  
  if (radius > 50) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  }
}
