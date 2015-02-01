class Bouncer extends Mover{
  
  Bouncer(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 10;
  }
  
  void update(){
    acc.rotate(PI/25);
    vel.add(PVector.mult(acc, 0.2));
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
  
  void display(){
    noStroke();
    fill(235, 235, 0);
    ellipse(loc.x, loc.y, size, size);
  }
}
