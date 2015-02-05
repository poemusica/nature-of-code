Mover[] movers;
PVector wind;
PVector gravity;
PVector wall;

void setup() {
  size(640, 360);
  
  gravity = new PVector(0, 0.1);
  
  movers = new Mover[1];
  for(int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(255);
  for(int i = 0; i < movers.length; i++) {
    Mover m = movers[i];
    wall = calcWall(m);
    wind = calcWind(m);
    m.applyForce(wind);
    m.applyForce(gravity);
    m.applyForce(wall);
    m.update();
    m.checkEdges();
    m.display();
    println(m.loc);
  }
}

PVector calcWind(Mover m) {
  PVector v = new PVector(0, 0);
  v.x = map(noise(m.loc.x / 100, (frameCount % width) / 100), 0, 1, -0.1, 0.1);
  v.y = map(noise(m.loc.y / 100, (frameCount % height) / 100), 0, 1, -0.1, 0.1);
  println("wind", v);
  return v;
}

PVector calcWall(Mover m) {
  PVector f = new PVector(0.25, 0.25);
  PVector v = new PVector(0, 0);
  float dx, dy;
  
  dx = width / 2 - m.loc.x;
  dy = height / 2 - m.loc.y;
  
  v.x = f.x * (dx / (width / 2));
  v.y = f.y * (dy / (height / 2));
  
  println("wall force", v);
  return v;
}
