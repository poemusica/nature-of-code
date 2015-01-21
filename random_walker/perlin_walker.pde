class PerlinWalker{
  float tx;
  float ty;
  PVector oldp;
  PVector newp;
  
  PerlinWalker(){
    tx = 0;
    ty = 10000;
    oldp = new PVector(width/2, height/2);
    newp = new PVector(width/2, height/2);
  }
  
  void display(){
    stroke(0, 255, 255);
    line(oldp.x, oldp.y, newp.x, newp.y);
  }
  
  void step(){
    oldp.set(newp);
    
   
    newp.x = map(noise(tx), 0, 1, 0, width);
    newp.y = map(noise(ty), 0, 1, 0, height);
    
    tx += 0.01;
    ty += 0.01;
    
  }
}
