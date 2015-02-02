class Balloon{
  int w, h, topspeed;
  PVector loc, vel, acc;
  
  Balloon(){
    w = 20;
    h = 50;
    loc = new PVector(width/2, height - h/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    topspeed = 5;
  }
  
  void rise(){
    PVector helium = new PVector(0, -0.01);
    applyForce(helium);
  }
  
  void applyForce(PVector force){
      acc.add(force);
  }
  
  void update(){
    rise();
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(loc.x, loc.y, w, h);
  }
}
