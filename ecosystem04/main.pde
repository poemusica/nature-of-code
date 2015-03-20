import java.util.Iterator;
import java.util.Random;

Mouse mouse;
Random generator;
ArrayList<Mover> movers;

void setup(){
  size(640, 360);
  background(255);
  generator = new Random();
  mouse = new Mouse(new PVector(mouseX, mouseY));
  movers = new ArrayList<Mover>();
  for (int i=0; i < 100; i++) {
    movers.add(new Mover(new PVector(random(0, width), random(0, height))));
  }
}

void draw(){
  background(255);
  
//  mouse.update();
  
  Iterator<Mover> iter = movers.iterator();
  while (iter.hasNext()) {
    Mover m = iter.next();
    if (m.isDead()) { iter.remove(); }
    for (Mover n : movers) {
      if (m != n && !n.isDead()) {
        m.hunt(n);
        m.applyForce(n.attract(m));
        m.applyForce(n.repel(m));
      }
    }
//    m.applyForce(mouse.repel(m));
    m.run();
  }
  
//  mouse.display();
}
