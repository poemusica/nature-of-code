void setup() {
  size(640,360);
}
 
void draw() {
  background(255);
 
  PVector period = new PVector(120, 100);
  PVector amplitude = new PVector (50, 100);
  float x = amplitude.x * cos(TWO_PI * frameCount / period.x);
  float y = amplitude.y * cos(TWO_PI * frameCount / period.y);
  stroke(0);
  fill(175);
  translate(width/2,height/2);
  line(0,0,x,y);
  ellipse(x,y,20,20);
}
