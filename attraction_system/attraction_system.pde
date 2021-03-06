class Attractor{
  PVector loc;
  float G, mass, s;
  
  Attractor(){
    loc = new PVector(random(width), random(height));
    G = 1;
    mass = random(40, 80);
    s = mass;
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(loc, m.loc);
    float dist = force.mag();
    dist = constrain(dist, s/2, s);
    float strength = G * (mass * m.mass) / sq(dist);
    force.setMag(strength);
    return force;
  }
  
  void display(){
    fill(255);
    ellipse(loc.x, loc.y, s, s);
  }
}
