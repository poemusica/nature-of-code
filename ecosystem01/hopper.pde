class Hopper extends Mover{
  PVector acc;
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    acc = PVector.random2D();
  }
  
  void bounce(){
    if ((loc.x == width) || (loc.x == 0)){
      vel.x = vel.x * -1;
    }
    if ((loc.y == height) || (loc.y == 0)){
      vel.y = vel.y * -1;
    }
  }
  
  void update(){
    float t = frameCount/20.0;
    float mag = t - floor(t);
    println(mag);
    
    if (mag < 0.1){
      acc = PVector.random2D();
    }
    
    acc.setMag(mag);
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    bounce();
  }
}
