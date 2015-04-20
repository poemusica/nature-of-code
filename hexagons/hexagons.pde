import java.math.BigDecimal;

PShape hexagon, layer1;
int size;
float ang;
float hyp;

void setup() {
  size(640, 360, P2D);
  //  shapeMode(CENTER);
  size = 25;
  ang = PI/3;
  hyp = sin(ang);
  hexagon = createShape();
  hexagon.beginShape();
  hexagon.stroke(0);
  hexagon.vertex(size, 0);
  hexagon.vertex(size/2, hyp*size);
  hexagon.vertex(-size/2, hyp*size);
  hexagon.vertex(-size, 0);
  hexagon.vertex(-size/2, hyp*-size);
  hexagon.vertex(size/2, hyp*-size);
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
    s.vertex(size, 0);
    s.vertex(size/2, hyp*size);
    s.vertex(-size/2, hyp*size);
    s.vertex(-size, 0);
    s.vertex(-size/2, hyp*-size);
    s.vertex(size/2, hyp*-size);
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
  layer1.setFill(color(175));
  shape(layer1, 0, 0);
  stroke(0);
  ellipse(0, 0, 3, 3);
  pushMatrix();
  PVector v = new PVector();
  hexagon.getVertex(1, v);
  v.mult(1.5);
  translate(v.x, v.y);
  v.setMag(size*hyp*5);
  v.rotate(PI/2);
  pushMatrix();
  translate(v.x, v.y);
  shape(layer1, 0, 0);
  line(0, 0, -v.x, -v.y);
  

  
  popMatrix();
  popMatrix();
  
  
  
  
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
//  PVector v = new PVector();
//  for (int i = 0; i < hexagon.getVertexCount (); i++) {
//    hexagon.getVertex(i, v);
//    v.rotate(radians(-48));
//    v.mult(4.6);
//    pushMatrix();
//    translate(v.x, v.y);
//    layer1.setFill(color(175));
//    shape(layer1, 0, 0);
//    popMatrix();
//  }

  //  pushMatrix();
  //  translate(0, hyp*size*2);
  //  shape(hexagon, 0, 0);
  //  popMatrix();
  //  pushMatrix();
  //  translate(0, hyp*-size*2);
  //  shape(hexagon, 0, 0);
  //  popMatrix();
  pushMatrix(); // layer 1 hex centers
  rotate(PI/2);
  hexagon.scale(hyp*2);
  hexagon.setFill(color(0, 0, 0, 0));
//  shape(hexagon, 0, 0);
  hexagon.resetMatrix();
  popMatrix();


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

