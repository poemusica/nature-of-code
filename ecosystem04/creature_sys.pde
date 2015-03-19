class CreatureSystem {
  ArrayList<Mover> creatures;
  PVector origin;
  float lifespan;
  
  CreatureSystem(PVector _orig) {
    creatures = new ArrayList<Mover>();
    origin = _orig.get();
    lifespan = 400;
  }
  
  boolean isDead() {
    if (lifespan <= 0 && creatures.size() <= 0) { return true; }
    return false;
  }
  
  void addCreature() {
    creatures.add(new Mover(origin));
  }
  
  // for forces that affect the entire system
  void applyForce(PVector force) {
    for (Mover m : creatures) {
      m.applyForce(force);
    }
  }
  
  void run() {
    Iterator<Mover> iter = creatures.iterator();
    while (iter.hasNext()) {
      Mover m = iter.next();
      m.run();
      if (m.isDead()) { iter.remove(); }
    }
    lifespan -= 0;
  }
}
