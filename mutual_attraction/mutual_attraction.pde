class Mover {
  PVector loc, vel, acc;
  float mass, s;
  float r, g, b, a;
  
  Mover() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(0.5), random(0.5));
    acc = new PVector(0, 0);
    
    mass = random(10, 30);
    s = mass;
    
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = random(220, 255);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(loc, m.loc);
    float dist = force.mag();
    dist = constrain(dist, s, 25);
    float strength = G * (mass * m.mass) / sq(dist);
    force.setMag(strength);
    return force;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);
    checkEdges();
    acc.mult(0);                           
  }
  
  void display() {
    noStroke();
    fill(r, g, b, a);
    ellipse(loc.x, loc.y, s, s);
  }
  
  void checkEdges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    }
    if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }
    if (loc.y > height) {
      loc.y = height;
      vel.y *= -1;
    }
    if (loc.y < 0) {
      loc.y = 0;
      vel.y *= -1; 
    }
  }
}
