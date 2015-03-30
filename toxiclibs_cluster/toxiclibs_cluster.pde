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
  
  for (int i = 0; i < 9; i++) {
    // number of nodes, diameter, center
    Cluster c = new Cluster(i + 2, 100, new Vec2D(random(50, width - 50), random(50, height - 50)));
    clusters.add(c);
  }
  
  for (int i = 0; i < clusters.size() - 1; i++) {
    Cluster c = clusters.get(i);
    for (int j = i + 1; j < clusters.size(); j++) {
      Cluster d = clusters.get(j);
      connect(c, d);
    }
  }
  
}

void draw() {
  physics.update();
  background(0);
  for (Cluster c : clusters) {
    c.display();
  }
  for (MinSpring s : minSprings) {
    s.display();
  }
}

void connect(Cluster c, Cluster d) {
  float minlen = 25;
  float springyness = 0.015;
  for (Node n : c.nodes) {
    for (Node m : d.nodes) {
      // node1, node1, minlen, springyness
      MinSpring s = new MinSpring(n, m, minlen, springyness);
      s.sCol = n.sCol;
      minSprings.add(s);
      physics.addSpring(s);
    }
  }
}
