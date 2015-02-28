class Hopper extends Mover{
  Oscillator oscR;
  Oscillator oscL;
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 2;
    oscR = new Oscillator();
    oscR.range.set(PI/4, -PI/4);
    oscL = new Oscillator();
    oscL.range.set(-PI/4, PI/4);
  }
  
  void update(){
    if (frameCount % 100 == 1){
      vel.add(PVector.mult(acc, topspeed));
    }
    else {
      vel.add(PVector.mult(acc, -topspeed/100));
    }
    
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
    
    oscR.aVelocity = vel.mag() * 0.5;
    oscR.oscillate();
    
    oscL.aVelocity = vel.mag() * 0.5;
    oscL.oscillate();
  }
  
  void display(){
    noStroke();
    fill(200, 235, 0);
    ellipse(loc.x, loc.y, size, size);
    
    oscR.origin = loc;
    oscR.angR = vel.heading();
    oscR.display();
    
    oscL.origin = loc;
    oscL.angR = vel.heading() + PI;
    oscL.display();
  }
}
