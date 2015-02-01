class Snake extends Mover{
  
  Snake(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 6;
    acc = new PVector(0, 0.1);
  }
  
  void update(){
    acc.x = sin(radians(frameCount * 6 % 360));
    
    if (acc.x < -0.5){
      vel.add(PVector.mult(acc, -0.6));
    }
    
    if (acc.x > 0.5){
      vel.add(PVector.mult(acc, 0.5));
    }
    
    else {
      vel.add(acc);
    }

    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
  
  void display(){
    noStroke();
    fill(235, 0, 235);
    ellipse(loc.x, loc.y, size, size);
  }
}
