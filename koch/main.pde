PShape hexagon;
PShape triangle;
KochList[] koches;
int kli, li;

void setup() {
  size(640, 600, P2D);
  registerHex();
  registerTri();
  
  kli = 0;
  li = 0;
  koches = new KochList[3];
  PVector s = new PVector();
  PVector e = new PVector();
  for (int i = 0; i < 3; i++) {
    triangle.getVertex(i % 3, s);
    triangle.getVertex((i+1) % 3, e);
    KochList koch = new KochList(s, e, 5);
    koches[i] = koch;
   }
}

void draw() {
//  background(255);
  translate(width/2, height/2);
  KochList k = koches[kli];
  KochLine l = k.lines.get(li);
  l.display();
  if (li < k.lines.size() - 1) {
    li++;
  } else if (kli < koches.length - 1) {
    li = 0;
    kli++;
  }
//  for (KochList k : koches) {
//    k.display();
//  }
}

void registerTri() {
  PVector u = new PVector(200, 0);
  triangle = createShape();
  triangle.beginShape();
  for (int i = 0; i < 3; i++) {
    triangle.vertex(u.x, u.y);
    u.rotate(radians(120));
  }
  triangle.endShape(CLOSE);
}

void registerHex() { // register hexagon as a PShape
  PVector u = new PVector(200, 0);
  hexagon = createShape();
  hexagon.beginShape();
  hexagon.stroke(0);
  for (int i = 0; i < 6; i++) {
    hexagon.vertex(u.x, u.y);
    u.rotate(PI/3);
  }
  hexagon.endShape(CLOSE);
}
