class Hopper extends Mover{
  Oscillator osc;
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 2;
    osc = new Oscillator();
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
    
    osc.aVelocity = PVector.mult(vel, 0.4);
    osc.angR = vel.heading() + PI;
    osc.origin = loc;
    osc.oscillate();
  }
  
  void display(){
    noStroke();
    fill(200, 235, 0);
    ellipse(loc.x, loc.y, size, size);
    osc.display();
  }
}
