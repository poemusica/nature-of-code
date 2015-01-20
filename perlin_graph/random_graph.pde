class RandomGraph{
  float x;
  float y;
  float newx;
  float newy;
  
  RandomGraph(){
    x = 0;
    y = 0;
    newx = 2;
    newy = random(0, height);
  }
  
  void display(){
    stroke(0, 255, 0);
    line(x, y, newx, newy);
  }
  
  void plot(){
    x = newx;
    y = newy;
    
    newx += 2;
    newy = random(0, height);
  }
}
