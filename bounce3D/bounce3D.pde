class Ball{
  PVector location;
  PVector speed;
  
  Ball(){
    location = new PVector(width/2, height/2, 100);
    speed = new PVector(2.5, 2.5, 2.5);
  }
  
  void move(){
    location.add(speed);
    if (location.x > width - 40 || location.x < 40){
      speed.x = speed.x * -1;
    }
    if (location.y > height - 40 || location.y < 40){
      speed.y = speed.y * -1;
    }
    
    if (location.z > 0 || location.z < -400){
      speed.z = speed.z * -1;
    }
    
  }
  
  void display(){
    fill(255, 0, 255);
    pushMatrix();
    translate(location.x, location.y, location.z);
    lights();
    sphere(20);
    popMatrix();
  }
}
