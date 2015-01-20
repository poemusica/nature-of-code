class PerlinGraph{
  float offset;
  float x;
  float y;
  float newx;
  float newy;
  
  PerlinGraph(){
    offset = height/2;
    x = 0;
    y = noise(x/40) * 100 + offset;
    
    newx = 1;
    newy = noise(newx/40) * 100 + offset;
  }
  
  void display(){
    stroke(0, 0, 255);
    line(x, y, newx, newy);
  }
  
  void plot(){
    x = newx;
    y = newy;
    
    newx += 1;
    newy = noise(newx/40) *100 + offset;
  }
  
}
