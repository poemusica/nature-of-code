import java.util.Iterator;
import java.util.Random;

PVector gravity, combustion;
PImage smokeImg, fireImg, emberImg;
Random generator;

ArrayList<ParticleSystem> pSystems;

void setup() {
  size(640, 360);
  imageMode(CENTER);
  rectMode(CENTER);
  generator = new Random();
  smokeImg = loadImage("white.png");
  fireImg = loadImage("red.png");
  emberImg = loadImage("red2.png");
  gravity = new PVector(0, 0.1);
  combustion = new PVector(0.1, 0);
  pSystems = new ArrayList<ParticleSystem>();

}

void draw() {
  background(0);
  
  Iterator<ParticleSystem> iter = pSystems.iterator();
  while (iter.hasNext()) {
    ParticleSystem pSys = iter.next();
    pSys.applyForce(new PVector(map(noise(frameCount/100), 0, 1, -0.05, 0.05), map(noise(millis()), 0, 1, -0.05, 0.05)));
    pSys.run();
    if (pSys.isDead()) { iter.remove(); }
  }
}

void mouseClicked() {
  pSystems.add(new FireSystem(new PVector(mouseX, mouseY)));
}
