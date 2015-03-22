// eventually refactor some functionality into Creature class
class Mover{
  Mover parent;
  PVector id;
  PVector loc, vel, acc, fillcolor;
  float topspeed;
  float mass, size, alpha;
  float health, age;
  
  Mover(PVector _loc){
    parent = this; 
    loc = _loc.get();
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    topspeed = 5;
    
//    size = (int) generator.nextGaussian() * 2 + 50;
    
    size = 20;
    mass = size;
    health = 400;
    age = 0;
    
    float b = (int) generator.nextGaussian() * 50 + 205;
    fillcolor = new PVector(0, 0, b);
    alpha = 245;
  }
  
  void run() {
    update();
    display();
  }
  
  boolean isDead() {
    if (health <= 0) { return true; }
    return false;
  }
  
  boolean laidEgg() {
    float r = random(1);
    if (age > 1 && r > 0.99) { return true; } // probability of laying eggs after reaching maturity
    return false;
  }
  
  void eat(Mover m) {
    m.health = 0;
    fillcolor.x += 30;
    fillcolor.x = constrain(fillcolor.x, 0, 255);
    size += 10; // grow bigger as you eat
    size = constrain(size, 25, 150);
    health += m.size; // bigger food is more nutritious
  }
  
  void hunt(Mover m) {
    PVector v = PVector.sub(m.loc, loc);
    float delta = abs(v.heading() - vel.heading());
    if (v.mag() <= size * 0.4 && (delta <= radians(90) || delta >= TWO_PI - radians(90))) {
      // if within range and facing the food, eat.
      eat(m);
    }
  }
  
  PVector wander() { // makes movement jittery :(
    PVector f = PVector.random2D();
    return PVector.lerp(f, acc, 0.6);
  }
  
  PVector attract(Mover m) { 
    PVector f = PVector.sub(loc, m.loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag((100 * mass)/sq(dist)); // attract strength = 50
    return f;
  }
  
  PVector repel(Mover m) {
    PVector f = PVector.sub(m.loc, loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag((100 * mass)/sq(dist)); // repel strength = 50
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
//    applyForce(wander());
    
    float speed = map(health, 0, 400, 0, topspeed); // health determines max possible speed
    
    vel.add(acc);
    vel.limit(constrain(speed, -topspeed, topspeed));
    loc.add(vel);
    acc.mult(0);
    
    wrap();
    
    health -= 1; // lose health over time
    age += 0.03; // age 1mo/sec at 30 fps
  }
  
  void display(){
    pushMatrix();
    pushStyle();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    noStroke();
    fill(id.x, id.y, id.z, alpha);
//    fill(fillcolor.x, fillcolor.y, fillcolor.z, alpha);
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
