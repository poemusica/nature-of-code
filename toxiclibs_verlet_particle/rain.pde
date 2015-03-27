class Rain {
  ArrayList<Particle> drops;
  
  Rain() {
    drops = new ArrayList<Particle>();
  }
  
  void run() {
    Particle q = new Particle(new Vec2D(random(width), 0));
    drops.add(q);
    physics.addParticle(q);
    
    Iterator iter = drops.iterator();
    while (iter.hasNext()) {
      Particle p = (Particle) iter.next();
      if (p.alpha <= 0) {
        iter.remove();
        physics.removeParticle(p);
      } else { 
        p.display();
        p.alpha -= 1;
      }
    }
  }

}
