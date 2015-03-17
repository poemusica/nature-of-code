import java.util.Iterator;
import java.util.Random;

PVector gravity, combustion;
PImage smokeImg, emberImg, blueImg;
Random generator;

ArrayList<ParticleSystem> pSystems;

void setup() {
  size(640, 360, P2D); //blending
  imageMode(CENTER);
  rectMode(CENTER);
  generator = new Random();
  smokeImg = loadImage("white.png");
  emberImg = loadImage("red2.png");
  blueImg = loadImage("blue.png");
  gravity = new PVector(0, 0.1);
  combustion = new PVector(0.1, 0);
  pSystems = new ArrayList<ParticleSystem>();

}

void draw() {
  blendMode(ADD);
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
  pSystems.add(new CrazySystem(new PVector(mouseX, mouseY)));
}
