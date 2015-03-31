class Cluster {
  Node handle;
  
  ArrayList<Node> nodes;
  
  ArrayList<Spring> springs; // internal cluster springs
  ArrayList<ConstrainedSpring> outerSprings; // circumference
  ArrayList<ConstrainedSpring> radialSprings; // spokes

  PVector sCol, osCol, rsCol, fCol;
  
  Cluster (float n, float d, Vec2D _center) {
    nodes = new ArrayList<Node>();
    
    springs = new ArrayList<Spring>();
    outerSprings = new ArrayList<ConstrainedSpring>();
    radialSprings = new ArrayList<ConstrainedSpring>();
    
    handle = new Node(_center);
    physics.addParticle(handle);
    
    sCol = new PVector(random(255), random(255), random(255));
    osCol = new PVector(random(255), random(255), random(255));
    rsCol = new PVector(random(255), random(255), random(255));
    fCol = new PVector(random(255), random(255), random(255));
    
    // initializes nodes in a relatively stable formation
    for (float i = 0.0; i < n; i++) {
      Vec2D v = new Vec2D(100, 0);
      v.rotate(TWO_PI * (i / n));
      Node node = new Node(handle.add(v));
      nodes.add(node);
    }
    
    // creates all spring connections
    for(int i = 0; i < nodes.size(); i++) {
      Node current = nodes.get(i);
      Node next;
      if (i == nodes.size()-1) {
        next = nodes.get(0);
      } else {
        next = nodes.get(i+1);
      }
      
      // radial springs connect nodes to center handle.
      ConstrainedSpring rs = new ConstrainedSpring(handle, current, 75, 0.05);
      radialSprings.add(rs);
      
      // outer springs connect adjacent nodes
      ConstrainedSpring os = new ConstrainedSpring(current, next, 20, 0.35);
      outerSprings.add(os);
      
      // internal springs connect nodes to each other
      for (int j = i + 1; j < nodes.size(); j++) {
        Node nJ = nodes.get(j);
        Spring s = new Spring(current, nJ, 200, 0.0001);
        springs.add(s);
      }
      
    }
  }
  
  void display() {
    
    // shape
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
    for (ConstrainedSpring os : outerSprings) {
      os.display();
    }
    
    // internal springs
    stroke(sCol.x, sCol.y, sCol.z, 75);
    for (Spring s : springs) {
      s.display();
    }
    
    // radial springs
    stroke(rsCol.x, rsCol.y, rsCol.z, 110);
    for (ConstrainedSpring rs : radialSprings) {
      rs.display();
    }
    
    // center handle
    handle.display();
  }
  
}
