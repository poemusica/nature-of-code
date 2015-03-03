import java.util.Iterator;

Spaceship ss;
PVector drag;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  ss = new Spaceship();
}

void draw() {
  background(0);
  if (!keyPressed) {ss.thrusting = false;}
  drag = ss.vel.get();
  drag.div(2);
  drag.mult(-1);
  ss.applyForce(drag);
  ss.update();
  ss.display();
}

void keyPressed() {
  if (key == 'z') {
    ss.thrusting = true;
    ss.thrust();
  }
  if (keyCode == LEFT) {
    ss.ang += radians(-5);
  }
 if (keyCode == RIGHT) {
   ss.ang += radians(5);
 } 
}
