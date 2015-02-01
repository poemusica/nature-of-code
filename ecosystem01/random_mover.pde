class RandomMover extends Mover{
  
  RandomMover(int x, int y, int _size){
    super(x, y, _size);
  }
  
  void update(){
    PVector acc;
    acc = PVector.random2D();
    
    float accX = map(noise(loc.x/100, frameCount/100), 0, 1, -1, 1);
    float accY = map(noise(frameCount/100, loc.y/100), 0, 1, -1, 1);
    acc = new PVector(accX, accY);
    
    acc.mult(1.5);
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }

}
