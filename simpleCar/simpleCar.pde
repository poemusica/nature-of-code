class Car{
  PVector loc, vel, acc;
  int maxspeed;
  float h;
  
  Car(){
    loc = new PVector(random(0, width), random(0, height));
    vel = PVector.random2D();
    h = vel.heading();
    vel.mult(0);
    acc = new PVector(0, 0);
    maxspeed = 5;
  }
  
  void display(){
    fill(255, 255, 0);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(h);
    triangle(0, 10, 20, 0, 0, -10);
    ellipse(20, 0, 5, 5);    
    popMatrix();
  }
  
  void move(){
    vel.add(acc);
    h = vel.heading();
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
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
