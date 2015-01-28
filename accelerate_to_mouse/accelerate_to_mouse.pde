class Mover{
  PVector loc, vel;
  float topspeed;
  
  Mover(){
    loc = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    topspeed = 7;
  }
  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector acc = PVector.sub(mouse, loc);
    float dist = acc.mag();
    acc.normalize();
    acc.mult(10/dist);
//    acc.mult(sq(50)/ sq(dist));
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
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
