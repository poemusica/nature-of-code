class Perlin3D {
  
  Perlin3D(){
  }
  
  void display(){
    for (int x = 20; x < width - 20; x = x + 20){
      for (int y = 20; y < height - 20; y = y + 20){
        beginShape(QUADS);
        vertex(x, y, map(noise(x/10, y/10), 0, 1, 0, 30));
        vertex(x + 20, y, map(noise((x + 20)/10, y/10), 0, 1, 0, 30));
        vertex(x + 20, y + 20, map(noise((x + 20)/10, (y + 20)/10), 0, 1, 0, 30));
        vertex(x, y + 20, map(noise(x/10, (y + 20)/10), 0, 1, 0, 30));
        endShape();
      }
    }
    
  }
  
  
}
