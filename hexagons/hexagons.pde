PShape hexagon, layer1;
int size;
float ang;
float hyp;

void setup() {
  size(700, 700, P2D);
  //  shapeMode(CENTER);
  size = 5;
  ang = PI/3;
  hyp = sin(ang);
  PVector u = new PVector(size, 0);
  hexagon = createShape();
  hexagon.beginShape();
  hexagon.stroke(0);
  for (int i = 0; i < 6; i++) {
    hexagon.vertex(u.x, u.y);
    u.rotate(radians(60));
  }
  hexagon.endShape(CLOSE);
  layer1 = createShape(GROUP);
  layer1.addChild(hexagon);
  for (int i = 0; i < hexagon.getVertexCount (); i++) {
    PShape s;
    PVector v = new PVector();
    hexagon.getVertex(i, v);
    v.rotate(PI/2);
    v.mult(hyp*2);
    s = createShape();
    s.beginShape();
    s.stroke(0);
    for (int j = 0; j < 6; j++) {
      s.vertex(u.x, u.y);
      u.rotate(radians(60));
    }
    s.endShape(CLOSE);
    s.translate(v.x, v.y);
    layer1.addChild(s);
  }
}

void draw() {
  background(255);
  textAlign(CENTER);
  pushMatrix();
  translate(width/2, height/2);
  layer1.setFill(color(75, 35, 150));
  shape(layer1, 0, 0); // 1st layer
  stroke(0);
//  ellipse(0, 0, 3, 3);

//  pushMatrix(); // 2nd layer
//  PVector v = new PVector();
//  hexagon.getVertex(1, v);
//  v.mult(1.5);
//  translate(v.x, v.y);
//  v.setMag(size*hyp*5);
//  v.rotate(PI/2);
//  pushMatrix();
//  translate(v.x, v.y);
//  shape(layer1, 0, 0); // layer 10
//  line(0, 0, -v.x, -v.y);
//
//  pushMatrix();
//  v.mult(0);
//  v.set(size*hyp*2, 0);
//  v.rotate(radians(-150));
//  line(0, 0, v.x, v.y);
//  translate(v.x, v.y);
//  v.mult(2);
//  v.rotate(PI/3);
//  translate(v.x, v.y);
//  shape(layer1, 0, 0); // layer 20
//  line(0, 0, -v.x, -v.y);
//  popMatrix();
//
//  popMatrix();
//  popMatrix();

  // calculations for layer 2
  PVector q = new PVector(); // data
  PVector p = new PVector(size, 0); // helper
  p.rotate(radians(120));
  p.mult(4);
  q.add(p);
  p.set(size, 0);
  p.rotate(PI);
  q.add(p);
  println(q.heading(), q.mag()/size);
  PVector v = new PVector(); // layer 2
  for (int i = 0; i < hexagon.getVertexCount (); i++) {
    hexagon.getVertex(i, v);
    v.rotate(q.heading()); //angle between q and p
    v.mult(q.mag()/size); // magnitude of q
    pushMatrix();
    translate(v.x, v.y);
    layer1.setFill(color(150, 35, 150));
    shape(layer1, 0, 0);
    popMatrix();
  }
  // calculations for layer 3
  p.set(-size, 0);
  q.set(0, 0);
  p.mult(12);
  q.add(p);
  p.set(0, 2*hyp*size);
  q.add(p);
  println(q.heading(), q.mag()/size);
  for (int i = 0; i < hexagon.getVertexCount (); i++) {
    hexagon.getVertex(i, v);
    v.rotate(q.heading()); //angle of q
    v.mult(q.mag()/size); // magnitude of q
    pushMatrix();
    translate(v.x, v.y);
    layer1.setFill(color(225, 35, 150));
    shape(layer1, 0, 0);
    PVector u = new PVector(); // layer 2
    for (int j = 0; j < hexagon.getVertexCount (); j++) {
      hexagon.getVertex(j, u);
      u.rotate(2.2845206); //angle of q
      u.mult(4.582576); // magnitude of q
      pushMatrix();
      translate(u.x, u.y);
      layer1.setFill(color(225, 35, 150));
      shape(layer1, 0, 0);
      popMatrix();
    }
    popMatrix();
  }
  
  // calculations for layer 4
  p.set(hyp*size, 0);
  q.set(-size, 0);
  q.mult(48);
  q.add(p);
  
  for (int i = 0; i < hexagon.getVertexCount (); i++) {
    hexagon.getVertex(i, v);
    v.rotate(q.heading()); //angle of q
    v.mult(q.mag()/size); // magnitude of q
    pushMatrix();
    translate(v.x, v.y);
    layer1.setFill(color(225, 35, 150));
    shape(layer1, 0, 0);
    PVector u = new PVector(); // layer 2
    for (int j = 0; j < hexagon.getVertexCount (); j++) {
      hexagon.getVertex(j, u);
      u.rotate(2.2845206); //angle of q
      u.mult(4.582576); // magnitude of q
      pushMatrix();
      translate(u.x, u.y);
      layer1.setFill(color(225, 35, 150));
      shape(layer1, 0, 0);
      popMatrix();
    }
    popMatrix();
  }
  line(0, 0, q.x, q.y);
    

  //  fill(0);
  //  text(0, 0, textDescent());
  //  shape(hexagon, 0, 0);
  //  for (int i = 0; i < hexagon.getVertexCount(); i++) {
  //    PVector v = new PVector();
  //    hexagon.getVertex(i, v);
  //    v.rotate(PI/2);
  //    v.mult(hyp*2);
  //    text(i+1, v.x, textDescent()+v.y);
  //    shape(hexagon, v.x, v.y);
  //  } 

  //  pushMatrix();
  //  translate(0, hyp*size*2);
  //  shape(hexagon, 0, 0);
  //  popMatrix();
  //  pushMatrix();
  //  translate(0, hyp*-size*2);
  //  shape(hexagon, 0, 0);
  //  popMatrix();

  //  pushMatrix(); // layer 1 hex centers
  //  rotate(PI/2);
  //  hexagon.scale(hyp*2);
  //  hexagon.setFill(color(0, 0, 0, 0));
  //  shape(hexagon, 0, 0);
  //  hexagon.resetMatrix();
  //  popMatrix();


  //  pushMatrix(); // layer 2 hex centers
  //  rotate(-TWO_PI/7);
  //  hexagon.scale(hyp*5.5);
  //  hexagon.setFill(color(0, 0, 0, 0));
  //  shape(hexagon, 0, 0);
  //  PVector p = hexagon.getVertex(0);
  //  p.mult(hyp*5.5);
  //  line(0, 0, p.x, p.y);
  //  hexagon.resetMatrix();
  //  popMatrix();

  popMatrix();
}

