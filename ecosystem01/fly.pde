class Fly extends Mover{
  int sign;
  
  Fly(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 8;
    sign = 1;
  }
  
  void update(){
    if (random(0, 100) > 95){
      sign *= -1;
    }
    acc.rotate(sign * ((PI/random(5, 15)) * 0.5));
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
  
  void display(){
    noStroke();
    fill(0, 235, 235);
    ellipse(loc.x, loc.y, size, size);
  }
  
}
