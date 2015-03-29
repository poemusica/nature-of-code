class Cluster {
  ArrayList<Node> nodes;
  ArrayList<Spring> springs;
  float diameter; // rest length between nodes
  float springyness;
  PVector sCol;
  
  Cluster (float n, float d, Vec2D center) {
    nodes = new ArrayList<Node>();
    springs = new ArrayList<Spring>();
    diameter = d;
    springyness = 0.09;
    sCol = new PVector(random(255), random(255), random(255));
    
    // create n nodes
    for (int i = 0; i < n; i++) {
      Node node = new Node (center.add(Vec2D.randomVector()));
      node.sCol = sCol;
      nodes.add(node);
    }
    
    for (int i = 0; i < nodes.size() - 1; i++) {
      Node nI = nodes.get(i);
      for (int j = i + 1; j < nodes.size(); j++) {
        Node nJ = nodes.get(j);
        Spring s = new Spring(nI, nJ, diameter, springyness);
        springs.add(s);
        s.sCol = sCol;
        physics.addSpring(s);
      }
    }
    
  }
  
  void display() {
    for (Node n : nodes) {
      n.display();
    }
    for (Spring s : springs) {
      s.display();
    }
  }
}
