import java.util.Iterator;

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

VerletPhysics2D physics;
Rain rain;

Particle p1, p2;
Spring spring;
Pendulum pendulum;

void setup() {
  size(640, 360);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.5)));
  
  rain = new Rain();

  spring = new Spring();
  
  pendulum = new Pendulum();
}

void draw() {
  background(255);

  physics.update(); // updates the world by one tick

  rain.run();  
  spring.display();
  pendulum.display();
  
  spring.repo();
  pendulum.repo();

}
