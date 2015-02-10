class Attractor {
  PVector loc;
  float mass, s;
  
  Attractor() {
    loc = new PVector(mouseX, mouseY);
    mass = 30;
    s  = mass;
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(loc, m.loc);
    float dist = force.mag();
    dist = constrain(dist, s, 15);
    float strength = G * (mass * m.mass) / sq(dist);
    force.setMag(strength);
    return force;
  }
  
  void update() {
    loc.x = mouseX;
    loc.y = mouseY;
  }
  
  void display() {
    noStroke();
    fill(250, 110);
    ellipse(loc.x, loc.y, s, s);
  }
}
