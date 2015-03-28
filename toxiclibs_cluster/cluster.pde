class Cluster {
  ArrayList<Node> nodes;
  ArrayList<Spring> springs;
  float diameter; // rest length between nodes
  float springyness;
  
  Cluster (int n, float d, Vec2D center) {
    nodes = new ArrayList<Node>();
    springs = new ArrayList<Spring>();
    diameter = d;
    springyness = 0.01;
    
    for (int i = 0; i < n; i++) {
      nodes.add(new Node (center.add(Vec2D.randomVector())));
    }
    
    for (int i = 0; i < nodes.size() - 1; i++) {
      Node nI = nodes.get(i);
      for (int j = i + 1; j < nodes.size(); j++) {
        Node nJ = nodes.get(j);
        Spring s = new Spring(nI, nJ, diameter, springyness);
        springs.add(s);
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
