import java.util.Iterator;

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
ArrayList<Particle> particles;

Particle p1, p2;
Spring spring;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  particles = new ArrayList<Particle>();
  
  p1 = new Particle(new Vec2D(100, 20));
  p2 = new Particle(new Vec2D(100, 180));
  spring = new Spring(p1, p2, 80, 0.01);
}

void draw() {
  background(0);
  Particle q = new Particle(new Vec2D(random(width), 0));
  particles.add(q);
  physics.addParticle(q);
  
  physics.update(); // updates the world by one tick
  
  Iterator iter = particles.iterator();
  while (iter.hasNext()) {
    Particle p = (Particle) iter.next();
    if (p.alpha <= 0) { iter.remove(); physics.removeParticle(p); }
    else {p.display(); p.alpha -= 1; }
  }
  
  spring.display();
  spring.repo();

}
