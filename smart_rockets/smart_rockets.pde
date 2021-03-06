class Rocket {
  DNA dna;
  PVector loc, vel, acc;
  float fitness, normFitness, record;
  boolean stopped, hitTarget;
  int finishTime;
  
  Rocket(int lifeSpan) {
    dna = new DNA(lifeSpan);
    loc = new PVector(width/2, height);
    vel = new PVector();
    acc = new PVector();
    stopped = false;
    record = 1000000;
    finishTime = 0;
  }
  
  void collisionCheck() {
    for (Obstacle ob : obs) {
      if (ob.contains(loc)) { stopped = true; }
    }
  }
  
  void targetCheck() {
    float d = PVector.dist(target.loc, loc);
    if (d < record) {
      record = d;
    }
    if (target.contains(loc)) {
      hitTarget = true;
    } else if (!hitTarget) {
      finishTime++;
    }
  }
  
  void evaluate(PVector target) {
    float d = PVector.dist(loc, target);
    fitness = 1/sq(d);
    if (stopped) { fitness *= 0.1; }
    if (hitTarget) { fitness *= 2; }
  }
  
  void normalize(float totalFitness) {
    normFitness = (fitness/totalFitness) * 100;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
  
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  } 
  
  void run(int num) {
    if (!stopped && !hitTarget) {
      applyForce(dna.genes[num]);
      update();
      collisionCheck(); 
    }
    targetCheck();
    display();
  }
  
  void display() {
    stroke(0, 175);
    fill(200, 175);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    triangle( -(cos(60) * 25)/2, 0, (cos(60) * 25)/2, -25/2, (cos(60) * 25)/2, 25/2);
    fill(0, 175);
    rect((cos(60) * 25)/2, -25/2, -2, 5);
    rect((cos(60) * 25)/2, 25/2, -2, -5);
    popMatrix();
  }
}
