import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D
import toxi.physics2d.behaviors.*; // for gravity

VerletPhysics2D physics;
Cluster c;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.6)));
  // number of nodes, diameter, center
  c = new Cluster(10, 100, new Vec2D(width/2, height/2));
}

void draw() {

  physics.update();
  
  background(255);
  c.display();
}
