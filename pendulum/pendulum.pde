class Pendulum{
  PVector pivot;
  float angle, angVel, angAcc, damping;
  float arm;
  
  Pendulum() {
    arm = 300;
    pivot = new PVector(width/2, 0);
    angle = radians(90);
    angVel = 0;
    angAcc = 0;
    damping = 0.995;
  }
  
  void update() {
    angAcc = (-gravity * sin(angle)) / arm;
    angVel += angAcc;
    angle += angVel;
    angVel *= damping;
  }
  
  void display() {
    translate(pivot.x, pivot.y);
    float x = arm * sin(angle);
    float y = arm * cos(angle);
    line(0, 0, x, y);
    fill(175);
    ellipse(x, y, 30, 30);
  }
}
