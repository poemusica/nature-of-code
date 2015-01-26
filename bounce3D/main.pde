// reference
// https://www.processing.org/tutorials/p3d/

Ball ball;

void setup(){
  size(640, 360, P3D);
  background(255);
  ball = new Ball();
  camera(0, 0, (height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, 1, 0);
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
