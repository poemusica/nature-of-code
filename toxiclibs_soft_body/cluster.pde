class Cluster {
  Node handle;
  
  ArrayList<Node> nodes;
  
  ArrayList<Spring> springs;
  ArrayList<Spring> outerSprings;
  ArrayList<MinSpring> handleSprings;

  PVector sCol, osCol, hsCol, fCol;
  
  Cluster (float n, float d, Vec2D _handle) {
    nodes = new ArrayList<Node>();
    
    springs = new ArrayList<Spring>();
    outerSprings = new ArrayList<Spring>();
    handleSprings = new ArrayList<MinSpring>();
    
    handle = new Node(_handle);
    physics.addParticle(handle);
    
    sCol = new PVector(random(255), random(255), random(255));
    osCol = new PVector(random(255), random(255), random(255));
    hsCol = new PVector(random(255), random(255), random(255));
    fCol = new PVector(random(255), random(255), random(255));
    

    for (float i = 0.0; i < n; i++) {
      Vec2D v = new Vec2D(100, 0);
      v.rotate(TWO_PI * (i / n));
      Node node = new Node(handle.add(v));
      nodes.add(node);
      physics.addParticle(node);
    }
    
    for(int i = 0; i < nodes.size() - 1; i++) {
      Node current = nodes.get(i);
      Node next = nodes.get(i+1);
      
      MinSpring hs = new MinSpring(handle, current, 75, 0.05);
      handleSprings.add(hs);
      physics.addSpring(hs);
      
      Spring os = new Spring(current, next, 20, 0.05);
      outerSprings.add(os);
      physics.addSpring(os);
      
      for (int j = i + 1; j < nodes.size(); j++) {
        Node nJ = nodes.get(j);
        Spring s = new Spring(current, nJ, 200, 0.0001);
        springs.add(s);
        physics.addSpring(s);
      }
      
    }
    Spring os = new Spring(nodes.get(nodes.size()-1), nodes.get(0), 20, 0.05);
    outerSprings.add(os);
    physics.addSpring(os);
 
    MinSpring hs = new MinSpring(handle, nodes.get(nodes.size()-1), 75, 0.05);
    handleSprings.add(hs);
    physics.addSpring(hs);
  }
  
  void display() {
    
    fill(fCol.x, fCol.y, fCol.z, 110);
    beginShape();
    noStroke();
    for (Node n : nodes) {
      n.display();
      vertex(n.x, n.y);
    }
    endShape(CLOSE);
    
    noFill();
    
    // outer springs
    stroke(osCol.x, osCol.y, osCol.z, 110);
    for (Spring os : outerSprings) {
      os.display();
    }
    
    // internal springs
    stroke(sCol.x, sCol.y, sCol.z, 75);
    for (Spring s : springs) {
      s.display();
    }
    
    // handle springs
    stroke(hsCol.x, hsCol.y, hsCol.z, 110);
    for (MinSpring hs : handleSprings) {
      hs.display();
    }
    handle.display();
  }
}
