class ParticleSystem {
  ArrayList<Particle> plist;
  PVector loc;
  float size;
  
  ParticleSystem(PVector _loc, float _size) {
    loc = _loc.get();
    size = _size;
    
    plist = new ArrayList<Particle>();
    
    float psize = size/10;
    float y = -size/2;
    
    for (float cols = psize; cols <= size; cols += psize){
      float x = -size/2;
      for (float rows = psize; rows <= size; rows += psize) {
        plist.add(new Particle(new PVector(x + (psize/2), y + (psize/2)), psize));
        x += size/10;
      }
      y += size/10;
    }
    
  }
  
  
  void run() {
    Iterator<Particle> iter = plist.iterator();
    while (iter.hasNext()) {
      Particle p = iter.next();
      p.update();
      pushMatrix();
      translate(loc.x, loc.y);
      p.display();
      popMatrix();
      
      PVector v = PVector.add(loc, p.loc);
      if (!isOnScreen(v)) {
        iter.remove();
      }
    }
  }
  
}
