class Mover{
  PVector loc, vel;
  
  Mover(float x, float y){
    loc = new PVector(0, 0);
  }
}

class Hopper extends Mover{
  
  Hopper(){
    super(5, 5);
    // do more stuff
  }
  
  void dostuff(){
    vel.add();
  }
}


