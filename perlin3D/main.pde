Perlin3D p3D;

void setup(){
  size(400, 400, P3D);
  p3D = new Perlin3D();
}

void draw(){
  pushMatrix();
  translate(-50, 20, -300);
  rotateY(0.25);
  rotateX(0.99);
  rotateZ(0);
  p3D.display();
  popMatrix();
}
