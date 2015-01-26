class Ball{
  PVector location;
  PVector vel;
  
  Ball(){
    location = new PVector(width/2, height/2, 0);
    vel = new PVector(3, 2, 1);
  }
  
  void collisionCheck(){
    if (location.x > width/2 + 80 || location.x < width/2 - 80){
      vel.x = vel.x * -1;
    }
    if (location.y > height/2 + 80 || location.y < height/2 - 80){
      vel.y = vel.y * -1;
    }
    if (location.z > 80 || location.z < -80){
      vel.z = vel.z * -1;
    }
  }
  
  void move(){
    location.add(vel);
    collisionCheck();
  }
    
  void display(){
    fill(255, 0, 255);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphere(20);
    popMatrix();
  }
}
