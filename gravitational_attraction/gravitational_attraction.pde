class Attractor{
  PVector loc;
  float G, mass, s;
  
  Attractor(){
    loc = new PVector(width/2, height/2);
    G = 0.4;
    mass = 20;
    s = 20;
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(loc, m.loc);
    float dist = force.mag();
    dist = constrain(dist, 5.0, 25.0);
    float strength = G * (mass * m.mass) / sq(dist);
    force.setMag(strength);
    return force;
  }
  
  void display(){
    fill(175);
    ellipse(loc.x, loc.y, s, s);
  }
}
