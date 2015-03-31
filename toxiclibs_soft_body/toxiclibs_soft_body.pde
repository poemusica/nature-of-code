import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D
import toxi.physics2d.behaviors.*; // for gravity
import toxi.processing.*;

VerletPhysics2D physics;
Cluster c;
Node selected;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.6)));
  // number of nodes, diameter, center
  c = new Cluster(25, 100, new Vec2D(width/2, height/2));
  selected = null;
}

void draw() {
  
  physics.update();

  background(255);
  c.display();
  
  if (mousePressed && selected != null) {
    selected.set(mouseX, mouseY);
  }
  
}

void mousePressed() {
  Vec2D mousePos = new Vec2D(mouseX, mouseY);
  if (selected == null) { selected = c.handle;}
}

void mouseReleased() {
  if (selected != null) {
    selected.unlock();
  }
  selected = null;
}
