class Pendulum{
  PVector origin, vel, acc;
  float angle, angVel, angAcc;
  float arm;
  
  Pendulum() {
    arm = 200;
    origin = new PVector(width/2, 0);
    angle = 0;
    angVel = 0;
    angAcc = 0;
  }
  
  void update() {
    angAcc = -gravity * sin(angle);
    angVel += angAcc;
    angle += angVel;
  }
  
  void display() {
    translate(origin.x, origin.y);
    float x = arm * cos(angle);
    float y = arm * sin(angle);
    line(0, 0, x, y);
    ellipse(x, y, 30, 30);
  }
}
