Population pop;
Obstacle[] obs;
Obstacle target;

void setup() {
  size(640, 480);
  pop = new Population(100);
  obs = new Obstacle[3];
  for (int n = 0; n < obs.length; n++) {
    obs[n] = new Obstacle(new PVector(random(20, width - 250), random(150, height - 250)), random(10, 100));
  }
  target = new Obstacle(new PVector(width/2, 40), 15);
}

void draw() {
  textSize(16);
  background(175);
  for (Obstacle ob : obs) {
    fill(0, 180);
    ob.display();
  }
  fill(255, 0, 0, 180);
  target.display();
  
  if (pop.lifeCounter < pop.lifeSpan) {
    pop.live();
    fill(0, 102, 153);
    text("generation: " + pop.generation, 10, 60);
    text("remaining cycles: " + (pop.lifeSpan - pop.lifeCounter), 10, 80);
    text("average distance: " + pop.prevAveDist, 10, 100);
    text("best distance: " + pop.prevBestDist, 10, 120);
    text("average time: " + pop.prevAveTime, 10, 140);
    text("best time: " + pop.prevBestTime, 10, 160);
  } else {
    pop.evolve();
  }
}
