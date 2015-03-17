import java.util.Iterator;
import java.util.Random;

PVector gravity, combustion;
ParticleSystem ps;
PImage img;
Random generator;

void setup() {
  size(640, 360);
  imageMode(CENTER);
  rectMode(CENTER);
  generator = new Random();
  img = loadImage("white.png");
  gravity = new PVector(0, 0.1);
  combustion = new PVector(0.1, 0);
  ps = new ParticleSystem(new PVector(width/2, height/2));
}

void draw() {
  background(0);
  ps.applyForce(new PVector(map(noise(frameCount/100), 0, 1, -0.05, 0.05), map(noise(millis()), 0, 1, -0.05, 0.05)));
  ps.run();
}
