class Hopper extends Mover{
  PVector dir;
  
  Hopper(int x, int y, int _size){
    super(x, y, _size);
    topspeed = 2;
    dir = acc.get();
  }
  
  void update(){
    if (frameCount % 100 == 1){
      acc = dir.get();
      acc.setMag(topspeed);
    }
    else {
      acc = vel.get();
      acc.setMag(-topspeed/100);
    }
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    noStroke();
    fill(200, 235, 0);
    ellipse(0, 0, size, size);
    stroke(35, 210, 100);
    line(0, 0, 0 + size/2, 0);
    popMatrix();
  }
}
