// reference
// https://www.processing.org/tutorials/p3d/

Ball ball;

void setup(){
  size(640, 360, P3D);
  background(255);
  ball = new Ball();
  beginCamera();
  translate(width/2, height/2);
  endCamera();
}

void draw(){
  beginCamera();
  rotateY(0.01);
  endCamera();

  background(255);
  ball.move();
  ball.display();
  drawBox();
}

void drawBox(){
  stroke(0);
  noFill();
  box(200);
}
