class Hopper extends Mover{
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 2;
  }
  
  void update(){
    if (frameCount % 100 == 1){
      vel.add(PVector.mult(acc, topspeed));
    }
    else {
      vel.add(PVector.mult(acc, -topspeed/99));
    }
    
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
  
  void display(){
    noStroke();
    fill(200, 235, 0);
    ellipse(loc.x, loc.y, size, size);
  }
}
