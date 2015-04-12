class Flock {
  ArrayList<Boid> boids;
  float r; // boid radius
  color col; // boid color
  Data shape; // boid arc angle
  Data view, sep, coh, ali, flee, seek, wander, edge;
  Data maxSpeed, maxForce;
  Data range, sepRange, cohRange, aliRange;
  Data angRange, angView, foo;
  
  Flock() {
    r = 12;
    col = color(0, 0, 0);
    
    color defaultUIcolor = color(0, 0, 0); // black
    color green = color(0, 255, 0);
    color purple = color(255, 0, 255);
    color yellow = color(255, 255, 0);
    color cyan = color(0, 255, 255);
    color gray = color(210, 210, 210);
    shape = new Data("shape", radians(30), 0, TWO_PI, col);
    
    // force scalars
    view = new Data("view", 0, 0, 2, cyan); //
    sep = new Data("separation", 0, 0, 2, green);
    coh = new Data("cohesion", 0, 0, 2, purple);
    ali = new Data("alignment", 0, 0, 2, yellow);
    flee = new Data("flee", 0, 0, 2, defaultUIcolor);
    seek = new Data("seek", 0, 0, 2, defaultUIcolor);
    wander = new Data("wander", 0, 0, 2, defaultUIcolor);
    edge = new Data("edge", 0.5, 0, 2, defaultUIcolor);
    
    // movement scalars
    maxSpeed = new Data("max speed", 3, 0, 5, defaultUIcolor);
    maxForce = new Data("max force", 0.2, 0, 2, defaultUIcolor);
    
    // perceptual distance and scalars
    range = new Data("range", sq(r)/2, 0, width/4, defaultUIcolor);
    sepRange = new Data("sep. zone", 2, 0, r, green); // multiplied with r
    cohRange = new Data("cohere zone", 0.75, 0, 1, purple); // multiplied with range
    aliRange = new Data("align zone", 0.5, 0, 1, yellow); // multiplied with range
    
    // perception angles
    angRange = new Data("perceptual range", radians(110), 0, TWO_PI, gray);
    angView = new Data("view zone", radians(45), 0, TWO_PI, cyan);
    
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
