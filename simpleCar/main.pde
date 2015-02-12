Car car;

void setup(){
  size(640, 360);
  car = new Car();
}

void draw(){
  background(0, 255, 0);
  
  car.move();
  car.checkEdges();
  car.display();
}

void keyPressed(){ 
     if (keyCode == UP){
       car.acc.set(0.1, 0);
       car.acc.rotate(car.h);
     }
    if (keyCode == DOWN){
      car.vel.mult(0.9);
    }
    if (keyCode == RIGHT){
      PVector p = new PVector(0.1, 0);
      car.acc.add(p);
    }
    if (keyCode == LEFT){
      PVector p = new PVector(-0.1, 0);
      car.acc.add(p);
    }
}
