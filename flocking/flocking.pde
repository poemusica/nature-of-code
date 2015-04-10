class Flock {
  ArrayList<Boid> boids;
  
  Flock() {
    boids = new ArrayList<Boid>();
    for (int i = 0; i < 50; i++) {
      boids.add(new Boid(new PVector(random(width), random(height))));
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
