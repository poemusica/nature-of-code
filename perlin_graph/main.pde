GaussianGraph gg;
RandomGraph rg;
PerlinGraph pg;

void setup(){
  size(640, 360);
  gg = new GaussianGraph();
  rg = new RandomGraph();
  pg = new PerlinGraph();
  
  strokeWeight(2);
  gg.display();
  rg.display();
  pg.display();
}

void draw(){
  gg.plot();
  gg.display();
  
  rg.plot();
  rg.display();
  
  pg.plot();
  pg.display();
  
}
