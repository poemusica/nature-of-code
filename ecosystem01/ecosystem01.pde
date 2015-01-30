class Mover{
  PVector loc, vel;
  float topspeed;
  
  Mover(int x, int y){
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    topspeed = 5;
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, 50, 50);
  }
  
  void checkEdges(){
    if (loc.x > width){
      loc.x = width;
    }
    if (loc.x < 0){
      loc.x = 0;
    }
    if (loc.y > height){
      loc.y = height;
    }
    if (loc.y < 0){
      loc.y = 0;
    }
  }
  
}

class Hopper extends Mover{
  
  Hopper(int x, int y){
    super(x, y);
    // do more stuff
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


