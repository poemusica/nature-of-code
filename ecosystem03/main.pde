Hopper h;

void setup(){
  size(640, 360);
  background(255);
  h = new Hopper(width/2, height/2, 50);
}

void draw(){
  background(255);
  h.update();
  h.display();
}
