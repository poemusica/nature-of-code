void setup() {
  size(1000, 600);
  strokeWeight(2);
  smooth();
}

void draw() {
  background(255);
  drawCircle(width/2, height/2, 200);
}

void drawCircle(float x, float y, float radius) {
  float noiseVal = 0;
  beginShape();
  strokeWeight(2);
  stroke(175, 75);
  fill(255, 0, 255, 25);
  for( float theta = 0; theta <= 360; theta++) {
    noiseVal += 0.1;
    float r = map(noise(noiseVal, frameCount), 0, 1, -radius/2, radius/2);
    r += radius;
    float xPoint = r * cos(radians(theta));
    float yPoint = r * sin(radians(theta));
    curveVertex(x + xPoint, y + yPoint);
  }
  endShape(CLOSE);
  
  if (radius > 25) {
    drawCircle(x + radius, y, radius/2);
    drawCircle(x - radius, y, radius/2);
    drawCircle(x, y + radius, radius/2);
    drawCircle(x, y - radius, radius/2);
  }
}
