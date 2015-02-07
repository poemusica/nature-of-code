Mover[] movers;
PVector wind, gravity, friction;

void setup() {
  size(640, 360);
  
  gravity = new PVector(0, 0.1);
  movers = new Mover[10];
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0, width), 0);
//    movers[i] = new Mover(random(0, width), random(0, height));
  }
}

void draw() {
  background(255);
  for(int i = 0; i < movers.length; i++) {
    Mover m = movers[i];
    
    wind = calcWind(m);
    friction = calcFriction(m);
    
    m.applyForce(wind);
    m.applyForce(PVector.mult(gravity, m.mass));
    m.applyForce(friction);
    
    m.update();
    m.checkEdges();
    m.display();
  }
}

PVector calcWind(Mover m) {
  PVector v = new PVector(0, 0);
  v.x = map(noise(m.loc.x / 100, (frameCount % width) / 100), 0, 1, -0.1, 0.1);
  v.y = map(noise(m.loc.y / 100, (frameCount % height) / 100), 0, 1, -0.1, 0.1);
  return v;
}

PVector calcFriction(Mover m) {
  float coefficient = 0.01;
  float normal = 1.0;
  PVector f = m.vel.get();
  f.normalize();
  f.mult(-coefficient * normal);
  return f;
}
