class Mover{
  PVector loc, vel, acc;
  float topspeed;
  float mass, size, fillcolor, lifespan, fadeRate;
  
  Mover(PVector _loc){
    loc = _loc.get();
    vel = new PVector(0, 0); //PVector.random2D();
    acc = new PVector(0, 0);
    topspeed = 5;
    
    mass =1;
    size = 50;
    lifespan = 255;
    fadeRate = 4;
    fillcolor = 175;
    
  }
  
  boolean isDead() {
    if (lifespan <= 0) { return true; }
    return false;
  }
  
  void run() {
    update();
    display();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    fill(fillcolor);
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
  
  void bounce(){
    if ((loc.x == width) || (loc.x == 0)){
      vel.x = vel.x * -1;
    }
    if ((loc.y == height) || (loc.y == 0)){
      vel.y = vel.y * -1;
    }
  }
  
  void wrap(){
    if (loc.x > width + size/2){
      loc.x = 0;
    }
    if (loc.x < -size/2){
      loc.x = width;
    }
    if (loc.y > height + size/2){
      loc.y = 0;
    }
    if (loc.y < -size/2){
      loc.y = height;
    } 
  }
  
}
