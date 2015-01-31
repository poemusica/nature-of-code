class Mover{
  PVector loc, vel;
  float topspeed;
  int size;
  
  Mover(int x, int y, int _size){
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    topspeed = 5;
    size = _size;
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, size, size);
  }
  
  void checkEdges(){
    if (loc.x > width - size/2){
      loc.x = width - size/2;
    }
    if (loc.x < 0 + size/2){
      loc.x = 0 + size/2;
    }
    if (loc.y > height - size/2){
      loc.y = height - size/2;
    }
    if (loc.y < 0 + size/2){
      loc.y = 0 + size/2;
    }
  }
  
}


