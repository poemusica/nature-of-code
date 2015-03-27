import java.util.Iterator;

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  particles = new ArrayList<Particle>();
}

void draw() {
  background(0);
 
  physics.update(); // updates the world by one tick
  Iterator iter = particles.iterator();
  while (iter.hasNext()) {
    Particle p = (Particle) iter.next();
    if (p.alpha <= 0) { iter.remove(); physics.removeParticle(p); }
    else {p.display(); p.alpha -= 1; }
  }
}

void mousePressed() {
  Particle p = new Particle(new Vec2D(mouseX, mouseY));
  particles.add(p);
  physics.addParticle(p);  
}
