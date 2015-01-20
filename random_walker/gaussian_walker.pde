import java.util.Random;

class GaussianWalker{
  float x;
  float y;
  PVector p;
  Random generator;
  
  GaussianWalker(){
    x = width/2;
    y = height/2;
    p = new PVector(x, y);
    generator = new Random();
  }
  
  void display(){
    stroke(0);
    point(p.x, p.y);
  }
  
  void step(){
    PVector q;
    q = PVector.random2D();
    float m = (float) generator.nextGaussian();
    q.setMag(m);
    p.add(q);
  }
}
