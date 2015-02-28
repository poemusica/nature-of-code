class Pendulum{
  PVector pivot, bob;
  float angle, angVel, angAcc, damping;
  float arm;
  
  Pendulum(PVector p, float _arm, float _ang) {
    arm = _arm;
    pivot = p;
    angle = radians(_ang);
    angVel = 0;
    angAcc = 0;
    bob = new PVector(arm * sin(angle), arm* cos(angle));
    damping = 0.995;
  }
  
  void update() {
    angAcc = (-gravity * sin(angle)) / arm;
    angVel += angAcc;
    angle += angVel;
    angVel *= damping;
    
    // PVector version
    bob.set(0, arm);
    bob.rotate(angle);
    
    // polar coordinate version
//    bob.set(arm * sin(angle), arm * cos(angle));
  }
  
  void display() {
    translate(pivot.x, pivot.y);
    line(0, 0, bob.x, bob.y);
    fill(175);
    ellipse(bob.x, bob.y, 30, 30);
  }
}
