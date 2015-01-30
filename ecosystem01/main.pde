Hopper h;

void setup(){
  size(640, 360);
  h = new Hopper(width/2, height/2);
}

void draw(){
  background(255);
  h.update();
  h.checkEdges();
  h.display();
  
}
