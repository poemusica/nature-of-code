class Perlin3D {
  
  Perlin3D(){
  }
  
  void display(){
    float zoff = 0.0;
    int z = 0;
    for (int x = 20; x < width - 20; x = x + 20){
      for (int y = 20; y < height - 20; y = y + 20){
//        for (int i = 0; i < 4; i++){
//          float z = map(noise(zoff), 0, 1, 0, 200);
          beginShape(QUADS);
          vertex(x, y, z);
          vertex(x + 20, y, z);
          vertex(x + 20, y + 20, z);
          vertex(x, y + 20, z);
          endShape();
//          z += 0.01;
//        }
      }
    }
    
  }
  
  
}
