import java.util.ListIterator; // needed for adding to list while iterating
import java.util.Iterator; // needed for removing from list while iterating
import java.util.Random; // needed for gaussian number generator
import java.util.Arrays; // needed for padding zeros in colorSpacer

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
  int initialPop = 20;
  for (int i = 0; i < initialPop; i++) {
    movers.add(new Mover(new PVector(random(0, width), random(0, height))));
    Mover m = movers.get(i);
    m.id = colorSpacer(i, initialPop);
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
      e.id = m.id;
      e.size = m.size/5;
      e.size = constrain(e.size, 15, 150);
      eggs.add(e);
      moverIter.add(e);
    }
  }
  
  Iterator<Egg> eggIter = eggs.iterator();
  while (eggIter.hasNext()) {
    Egg e = eggIter.next();
    if (e.hatched()) {
      movers.add(new Mover(e.loc));
      Mover m = movers.get(movers.size()-1);
      m.id = e.id;
      m.size = e.size;
      m.size = constrain(m.size, 25, 150);
      eggIter.remove();
    }
  }
}

PVector colorSpacer(int i, int total) { // produce rgb color vectors evenly-spaced along spectrum. 
  int step = (int) Math.pow(2, 24) / total; // space each color by this amount on the spectrum
  int colorNum = (int) step * (i + 1); // use 24-bit number to represent color
  String binStr = Integer.toBinaryString(colorNum);
  int numZeros = 24 - binStr.length();
  char[] zeros = new char[numZeros];
  Arrays.fill(zeros, '0');
  String zeroStr = new String(zeros);
  binStr = zeroStr + binStr; // to ensure string has 24 digits, pad the left with zeros if needed.
  int r = Integer.parseInt(binStr.substring(0, 8), 2); // 1st 8 bits represent r value
  int g = Integer.parseInt(binStr.substring(8, 16), 2); // 2nd 8 bits represent g value
  int b = Integer.parseInt(binStr.substring(16, 24), 2); // 3rd 8 bits represent b value
  return new PVector(r, g, b);
}
