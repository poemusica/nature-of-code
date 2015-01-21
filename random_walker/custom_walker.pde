class CustomWalker{
  float x;
  float y;
  PVector oldp;
  PVector newp;
  
  CustomWalker(){
    x = width/2;
    y = height/2;
    oldp = new PVector(x, y);
    newp = new PVector(x, y);
  }
  
  void display(){
    stroke(255, 255, 0);
    line(oldp.x, oldp.y, newp.x, newp.y);
  }
  
  void step(){
    oldp.set(newp);
    while (true) {
      PVector q = PVector.random2D();
      float m = random(0, 10);
      float num = random(0, 100);
      
      if (num < sq(m)){
        q.setMag(m);
        newp.add(q);
        return; 
      }
    }
  }
  
}
