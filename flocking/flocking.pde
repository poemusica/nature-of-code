class Flock {
  ArrayList<Boid> boids;
  float r; // boid radius
  Data view, sep, coh, ali, flee, seek, wander, edge;
  Data maxSpeed, maxForce;
  Data range, sepRange, cohRange, aliRange;
  Data angRange, angView;
  
  Flock() {
    r = 12; // boid radius
    
    // force scalars
    view = new Data("view", 0, 0, 2);
    sep = new Data("separation", 0, 0, 2);
    coh = new Data("cohesion", 0, 0, 2);
    ali = new Data("alignment", 0, 0, 2);
    flee = new Data("flee", 0, 0, 2);
    seek = new Data("seek", 0, 0, 2);
    wander = new Data("wander", 0, 0, 2);
    edge = new Data("edge", 0.5, 0, 2);
    
    // movement scalars
    maxSpeed = new Data("max speed", 3, 0, 5);
    maxForce = new Data("max force", 0.2, 0, 2);
    
    // perceptual distance and scalars
    range = new Data("range", sq(r)/2, 0, width/4);
    sepRange = new Data("sep. zone", 2, 0, r); // multiplied with r
    cohRange = new Data("cohere zone", 0.75, 0, 1); // multiplied with range
    aliRange = new Data("align zone", 0.5, 0, 1); // multiplied with range
    
    // perception angles
    angRange = new Data("perceptual range", radians(110), 0, TWO_PI);
    angView = new Data("desired view", radians(45), 0, TWO_PI);
    
    boids = new ArrayList<Boid>();
    for (int i = 0; i < 50; i++) {
      boids.add(new Boid(new PVector(random(width), random(height)), this));
    }
  }
  
  void run() {
    for (Boid b : boids) {
      b.run(boids);
    }
  }
  
  void addBoid(Boid b) {
    boids.add(b);
  }
}
