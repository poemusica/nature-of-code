Tree tree;
int bi, li;

void setup() {
  size(640, 360);
  tree = new Tree(100, 4);
  bi = 0;
  li = 0;
}

void draw() {
//  background(255);
  translate(width/2, height);
  if (bi < tree.branches.size() && frameCount % 20 == 0) {
    Branch b = tree.branches.get(bi);
    b.display();
    bi++;
  } else if (li < tree.leaves.size() && frameCount % 20 == 0) {
    Leaf l = tree.leaves.get(li);
    l.display();
    li++;
  }
//  tree.display();
}
