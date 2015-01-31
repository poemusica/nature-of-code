class Hopper extends Mover{
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
  }
  
  void update(){
    PVector acc;
    acc = PVector.random2D();
    acc.mult(1.5);
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
  }
}
