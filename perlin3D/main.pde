Perlin3D p3D;
float xrot;
float yrot;
float zrot;

void setup(){
  size(400, 400, P3D);
  p3D = new Perlin3D();
  xrot = 0.0;
  yrot = 0.0;
  zrot = 0.0;
}

void draw(){
  background(255);
  pushMatrix();
  translate(-50, 20, -300);
//  rotateY(yrot);
  rotateX(xrot);
//  rotateZ(zrot);

  rotateY(0.25);
//  rotateX(0.99);
  rotateZ(0);
  p3D.display();
  popMatrix();
  xrot += 0.01;
//  yrot += 0.01;
//  zrot += 0.01;
}
