Car car;

void setup(){
  size(640, 360);
  car = new Car();
}

void draw(){
  background(0, 255, 0);
  if (keyPressed == false){
      car.acc.set(0.0, 0.0);
  }
  
  car.move();
  car.checkEdges();
  car.display();
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      car.acc.sub(1.0, 1.0, 0);
    }
    if (keyCode == DOWN){
      car.vel.mult(0.9);
    }
    if (keyCode == RIGHT){
      car.vel.rotate(radians(25));
    }
    if (keyCode == LEFT){
      car.vel.rotate(radians(-25));
    }
  }
}
