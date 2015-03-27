class SpringyMesh {
  ArrayList<Particle> points;
  ArrayList<Spring> springs;
  int spacing, horizPoints, vertPoints;
  
  SpringyMesh() {
    spacing = 30;
    horizPoints = 6;
    vertPoints = 9;
    points = new ArrayList<Particle>();
    springs = new ArrayList<Spring>();
    
    // create points
    for (int j = 0; j < horizPoints; j++) {
      for (int i = 0; i < vertPoints; i++) {
        Particle p1 = new Particle( new Vec2D(j * spacing, i * spacing));
        points.add(p1);
        physics.addParticle(p1);
      }
    }
    
    points.get(0).lock();
    points.get((horizPoints * vertPoints) - vertPoints).lock();
    
    // create connector springs
    for (int i = 0; i < horizPoints * vertPoints; i++) {
      if ((i + 1) % vertPoints != 0) {
        // vertical connection
        Spring spring = new Spring(points.get(i), points.get(i+1), spacing, 0.08);
        springs.add(spring);
        physics.addSpring(spring);
      }
      // horizontal connection
      if (i < (horizPoints * vertPoints) - vertPoints) {
        Spring spring = new Spring(points.get(i), points.get(i + vertPoints), spacing, 0.08);
        springs.add(spring);
        physics.addSpring(spring);
      }
    }
    println(springs.size());
  }
  
  void display() {
    for (Spring s : springs) {
      s.display();
    }
    for (Particle p : points) {
      p.display();
    }
  }
  
}
