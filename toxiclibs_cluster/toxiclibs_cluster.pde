import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D

VerletPhysics2D physics;
Cluster cluster;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  // number of nodes, diameter, center
  cluster = new Cluster(27, 180, new Vec2D(width/2, height/2));
}

void draw() {
  physics.update();
  background(255);
  cluster.display();
}
