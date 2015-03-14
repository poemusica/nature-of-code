import java.util.Iterator;

ArrayList<Breakable> boxes;

void setup() {
  size(640, 360);
  rectMode(CENTER);
  boxes = new ArrayList<Breakable>();
  
  for (int i = 0; i < 3; i++) {
    boxes.add(new Breakable());
  }
}

void draw() {
  background(230);
  Iterator<Breakable> iter = boxes.iterator();
  while (iter.hasNext()) {
    Breakable b = iter.next();
    b.display();
    if (b.isDestroyed()) { iter.remove(); }
  }
}

void mouseClicked() {
  for (Breakable b : boxes) {
    if (abs(mouseX - b.loc.x) < b.size/2 && abs(mouseY - b.loc.y) < b.size/2) {
      b.isBroken = true;
    }
  }
}

boolean isOnScreen(PVector v) {
  if (v.x < 0 || v.x > width) {
    return false;
  }
  if (v.y < 0 || v.y > height) {
    return false;
  }
  return true;
}
