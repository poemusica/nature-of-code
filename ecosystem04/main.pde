import java.util.ListIterator;
import java.util.Iterator;
import java.util.Random;

Mouse mouse;
Random generator;
ArrayList<Mover> movers;
ArrayList<Mover> dead;
ArrayList<Egg> eggs;

void setup(){
  size(800, 640);
  background(255);
  rectMode(CENTER);
  generator = new Random();
  mouse = new Mouse(new PVector(mouseX, mouseY));
  dead = new ArrayList<Mover>();
  eggs = new ArrayList<Egg>();
  movers = new ArrayList<Mover>();
  for (int i=0; i < 100; i++) {
    movers.add(new Mover(new PVector(random(0, width), random(0, height))));
  }
}

void draw(){
  background(255);
  
  Iterator<Mover> deadIter = dead.iterator();
  while (deadIter.hasNext()) {
    Mover d = deadIter.next();
    if (d.alpha <= 0) { deadIter.remove(); continue;}
    d.display();
    d.alpha -= 0.5;
  }
  
  noStroke();
  fill(255, 150);
  rect(width/2, height/2, width, height);
  
  ListIterator<Mover> moverIter = movers.listIterator();
  while (moverIter.hasNext()) {
    Mover m = moverIter.next();
    if (m.isDead()) {
      dead.add(m);
      moverIter.remove();
      continue;
    }
    for (Mover n : movers) {
      if (m != n) {
        m.hunt(n); 
        m.applyForce(n.attract(m));
        m.applyForce(n.repel(m));
      }
    }
    m.run();
    
    if (m.laidEgg()) {
      Egg e = new Egg(m.loc);
      e.parent = m;
      e.size = m.size;
      eggs.add(e);
      moverIter.add(e);
    }
  }
  
  Iterator<Egg> eggIter = eggs.iterator();
  while (eggIter.hasNext()) {
    Egg e = eggIter.next();
    if (e.hatched()) {
      movers.add(new Mover(e.loc));
      eggIter.remove();
    }
  }
}
