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
    springyness = 0.01;
    sCol = new PVector(random(255), random(255), random(255));
    
    // create n nodes
    for (int i = 0; i < n; i++) {
      Node node = new Node (center.add(Vec2D.randomVector()));
      nodes.add(node);
      physics.addParticle(node);
    }
    
    // create node-to-node connections
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
  
  // cluster-to-cluster connections
  void connect(Cluster d) {
    float minlen = 100;
    float springyness = 0.0015;
    for (Node n : nodes) {
      for (Node m : d.nodes) {
        // connection includes color of originating cluster for clarity
        // node1, node1, minlen, springyness, color
        MinSpring s = new MinSpring(n, m, minlen, springyness, sCol); 
        minSprings.add(s);
        physics.addSpring(s);
      }
    }
  }
  
  void display() {
    // shape and nodes
    beginShape();
    fill(sCol.x, sCol.y, sCol.z, 110);
    strokeWeight(1);
    stroke(0);
    for (Node n : nodes) {
      n.display();
      vertex(n.x, n.y);
    }
    endShape(CLOSE);
    
    // node-to-node connections
    stroke(sCol.x, sCol.y, sCol.z, 110);
    strokeWeight(2);
    for (Spring s : springs) { s.display(); }
  }
}
