class EastWalker{
  float x;
  float y;
  
  EastWalker(){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(0, 255, 0);
    point(x,y);
  }
  
  void step(){
    float direction = random(0, 1);
    if (direction < 0.2){
      y--; // up
    }
    else if (direction < 0.4){
      y++; // down
    }
    else if (direction < 0.6){
      x--; // left
    }
    else { x++; } // right
  }
  
  
}
