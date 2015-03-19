Hopper h;
Bouncer b;
Fly f;
Snake s;
RandomMover r;

void setup(){
  size(640, 360);
  background(255);
  ellipseMode(CENTER);
  h = new Hopper(width/2, height/2, 50);
  b = new Bouncer(width/2, height/2, 40);
  f = new Fly(width/2, height/2, 15);
  s = new Snake(width/2, height/2, 30);
  r = new RandomMover(width/2, height/2, 25);
}

void draw(){
  background(255);
  h.update();
  h.display();
  
  b.update();
  b.display();
  
  f.update();
  f.display();
  
  s.update();
  s.display();
  
  r.update();
  r.display();
}
