class CustomWalker{
  float x;
  float y;
  PVector p;
  
  CustomWalker(){
    float x = width/2;
    float y = height/2;
    p = new PVector(x, y);
  }
  
  void display(){
    stroke(255, 255, 0);
    point(p.x, p.y);
  }
  
  void step(){
    
    while (true) {
      PVector q = PVector.random2D();
      float m = random(0, 10);
      float num = random(0, 100);
      
      if (num < sq(m)){
        q.setMag(m);
        p.add(q);
        return; 
      }
    }
  }
  
}
