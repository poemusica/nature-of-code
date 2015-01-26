class Car{
  PVector loc, vel, acc;
  int maxspeed, minspeed;
  
  Car(){
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxspeed = 10;
  }
  
  void display(){
    fill(255, 255, 0);
    pushMatrix();
    translate(loc.x, loc.y);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  
  void move(){
    acc.normalize();
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
  }
  
  void checkEdges(){
    if (loc.x > width){
      loc.x = 0;
    }
    if (loc.x < 0){
      loc.x = width;
    }
    if (loc.y > height){
      loc.y = 0;
    }
    if (loc.y < 0){
      loc.y = height;
    }
  }
  
}
