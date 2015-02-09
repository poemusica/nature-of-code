Attractor attractor;
Mover mover;

void setup(){
  size(640, 360);
  mover = new Mover();
  attractor = new Attractor();
}

void draw(){
  background(0);
  
  mover.applyForce(attractor.attract(mover));
  mover.update();
  
  attractor.display();
  mover.display();
}
