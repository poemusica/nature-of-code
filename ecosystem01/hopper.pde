class Hopper extends Mover{
  PVector acc;
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    acc = PVector.random2D();
  }
  
  void update(){
    if (frameCount % 100 == 1){
      vel.add(PVector.mult(acc, topspeed));
      println("speed up");
    }
    else {
      vel.add(PVector.mult(acc, -topspeed/99));
    }
    
// alternate version that also works pretty well for hop    
//    else {
//      if (vel.mag() < 0.1){
//        vel.setMag(0);
//      }
//      else {
//        vel.add(PVector.mult(acc, -1.0/10));
//      }
//    }
    
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
}
