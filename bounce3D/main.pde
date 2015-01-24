// reference
// https://www.processing.org/tutorials/p3d/

Ball ball;

void setup(){
  size(640, 360, P3D);
  background(255);
  ball = new Ball();
}

void draw(){
  background(255);
  ball.move();
  ball.display();
  drawBox();
}

void drawBox(){
  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  noFill();
  box(200);
  popMatrix();
}
