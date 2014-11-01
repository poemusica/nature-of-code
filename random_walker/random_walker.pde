class RandomWalker {
  float x;
  float y;
  
  RandomWalker(){
    x = width/2;
    y = height/2;
  }
  
  void display(){
    stroke(0);
    point(x, y);
  }
  
  void step(){
    float stepx = random(-1, 1); // yields float between -1.0 and 1.0
    float stepy = random(-1, 1);
    
    x += stepx;
    y += stepy;
  }
}
