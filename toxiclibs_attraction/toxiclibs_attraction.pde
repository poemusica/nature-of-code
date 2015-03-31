import toxi.physics2d.*; // for VerletParticle2D
import toxi.geom.*; // for Vec2D
import toxi.physics2d.behaviors.*; // for Behaviors

VerletPhysics2D physics;
ArrayList<Particle> particles;
ArrayList<Spring> springs;
Attractor attractor;

void setup() {
  size(900, 580);
  physics = new VerletPhysics2D(); // creating a toxiclibs Verlet physics world
  physics.setWorldBounds(new Rect(0, 0, width, height)); // global properties of world
  physics.setDrag(0.01);
  
  attractor = new Attractor(new Vec2D(width/2, height/2));
  springs = new ArrayList<Spring>();
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 25; i++) {
    Particle p = new Particle(new Vec2D(random(width), random(height)));
    particles.add(p);
    Spring s = new Spring(p, attractor, 10, 0.0001);
    springs.add(s);
  }
  
}

void draw() {
  physics.update();
  background(175);
  
  for (Spring s : springs) {
    s.display();
  }
  
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

