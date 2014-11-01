class SWWalker {
  float x;
  float y;
  
  SWWalker(){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(204, 102, 0);
    point(x, y);
  }
  
  void step(){
    float stepx = constrain(random(-3, 1), -1, 1); // yields float between -1.0 and 1.0
    float stepy = constrain(random(-1, 3), -1, 1);
    
    x += stepx;
    y += stepy;
  }
}
