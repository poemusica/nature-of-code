Balloon b;

void setup(){
  size(640, 360);
  b = new Balloon();
}

void draw(){
  background(255);
  windCondition(b);
  wallCheck(b);
  b.update();
  b.display();
}
