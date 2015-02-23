

void setup() {
  size(640, 360);
  xSpacing = 10; // modify to change number of points sampled.
  angSpacing = 0.01; // modify to zoom sampling selection. (best left as is.)
  angle = 0;
  angVel = 0.02; // modify to change undulation speed.
  if (angSpacing > 0.01) {
    r = 10 * xSpacing;
  }
  else { r = 2 * xSpacing; }
}

void draw() {
  background(210);
  for (int x = 0; x <= width; x += xSpacing) {
//    float y = map( noise( (angSpacing * x) + angle), 0, 1, 0, height); // perlin noise version.
    float y = map(sin( (angSpacing * x) + angle), -1, 1, 0, height);
    fill(110, 110);
    ellipse(x, y, r, r);
  }
  angle += angVel;
}
