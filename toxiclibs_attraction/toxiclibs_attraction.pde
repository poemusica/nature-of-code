import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D
import toxi.physics2d.behaviors.*; // for Behaviors

VerletPhysics2D physics;
ArrayList<Particle> particles;
Attractor attractor;

void setup() {
  size(900, 580);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.setDrag(0.01);
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 25; i++) {
    particles.add(new Particle(new Vec2D(random(width), random(height))));
  }
  attractor = new Attractor(new Vec2D(width/2, height/2));
}

void draw() {
  physics.update();
  background(175);
  
  fill(255);
  attractor.display();
  
  fill(0);
  for (Particle p : particles) {
    p.display();
  }
}

void mouseDragged() {
  attractor.lock();
  attractor.set(mouseX, mouseY);
}

