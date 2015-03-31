import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D

VerletPhysics2D physics;
ArrayList<Cluster> clusters;
ArrayList<MinSpring> minSprings;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  
  clusters = new ArrayList<Cluster>();
  minSprings = new ArrayList<MinSpring>();
  
  // create clusters
  for (int i = 0; i < 4; i++) {
    // number of nodes, diameter, center
    Cluster c = new Cluster(i + 5, 100, new Vec2D(random(50, width - 50), random(50, height - 50)));
    clusters.add(c);
  }
  
  // connect clusters to each other
  for (int i = 0; i < clusters.size() - 1; i++) {
    Cluster c = clusters.get(i);
    for (int j = i + 1; j < clusters.size(); j++) {
      Cluster d = clusters.get(j);
      c.connect(d);
    }
  }
}

void draw() {
  physics.update();
  background(175);
  
  // cluster-to-cluster connectors
  strokeWeight(1);
  for (MinSpring s : minSprings) {
    s.display();
  }
  
  for (Cluster c : clusters) {
    c.display();
  }
}
