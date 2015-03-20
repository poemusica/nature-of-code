// eventually refactor some functionality into Creature class
class Mover{
  PVector loc, vel, acc, fillcolor;
  float topspeed;
  float mass, size;
  float health;
  
  Mover(PVector _loc){
    loc = _loc.get();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    topspeed = 5;
    
    mass = 1;
    size = (int) generator.nextGaussian() * 2 + 50;
    health = 400;
    
    float b = (int) generator.nextGaussian() * 50 + 205;
    fillcolor = new PVector(0, 0, b);
  }
  
  void run() {
    update();
    display();
  }
  
  boolean isDead() {
    if (health <= 0) { return true; }
    return false;
  }
  
  void hunt(Mover m) {
    PVector v = PVector.sub(m.loc, loc);
    if (v.mag() < m.size/2 && abs(v.heading() - vel.heading()) <= radians(10) && size >= m.size) {
      m.health = 0;
      fillcolor.x += 30;
      fillcolor.x = constrain(fillcolor.x, 0, 255);
      size += 10;
    }
  }
  
  PVector wander() {
    PVector f = PVector.random2D();
    return PVector.lerp(f, acc, 0.6);
  }
  
  PVector attract(Mover m) {
    if (size > m.size) { return new PVector(0, 0); } // don't attract smaller movers. attract larger ones.
    PVector f = PVector.sub(loc, m.loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag(50/sq(dist)); // attract strength = 50
    return f;
  }
  
  PVector repel(Mover m) {
    if (size < m.size) { return new PVector(0, 0); } // don't repel larger movers. repel smaller ones.
    PVector f = PVector.sub(m.loc, loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag(100/sq(dist)); // repel strength = 25
    return f;
  }
  
  PVector toMouse() {
    PVector f = PVector.sub(new PVector(mouseX, mouseY), loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag(100/sq(dist)); // attract strength = 100
    return f;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
  
  void update() {
    applyForce(wander());
    
    vel.add(acc);
    vel.limit(topspeed);
    loc.add(vel);
    acc.mult(0);
    
    wrap();
  }
  
  void display(){
    pushMatrix();
    pushStyle();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    noStroke();
    float alpha = 245;
    if (isDead()) { alpha = 75; }
    fill(fillcolor.x, fillcolor.y, fillcolor.z, alpha);
    arc(0, 0, size, size, radians(15), TWO_PI - radians(15), PIE);
    popStyle();
    popMatrix();
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
