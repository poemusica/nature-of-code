class PerlinStepper{
  
  float x;
  float y;
  float t;
  PVector oldp;
  PVector newp;

  PerlinStepper(){
    x = width/2;
    y = height/2;
    t = 0;
    oldp = new PVector(x, y);
    newp = new PVector(x, y);
  }
  
  void display(){
    stroke(255, 0, 255);
    line(oldp.x, oldp.y, newp.x, newp.y);
  }
  
  void step(){
    oldp.set(newp);
    PVector q;
    q = PVector.random2D();    
    float n = map(noise(t), 0, 1, -200, 200);
    q.setMag(n);
    newp.add(q);
    
    t += 0.01;
  }
  
}
