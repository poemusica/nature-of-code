class PerlinCloud{
  float m;
  
  PerlinCloud(){
    noiseDetail(4, 0.75);
    m = 0.0;
  }
  
  void display(){
    loadPixels();
    float xoff = 0.0;
    for(int x = 0; x < width; x++) {
     float yoff = 0.0;
      for(int y = 0; y < height; y++){
        float r = map(noise(xoff + 0.1, yoff + 0.1, m), 0, 1, 0, 255);
        float g = map(noise(xoff * 2, yoff * 2, m), 0, 1, 0, 255);
        float b = map(noise(xoff, yoff, m), 0, 1, 0, 255);
        pixels[x+y*width] = color(r, g, b);
        yoff += 0.01;
      }
      xoff += 0.01;
    }
    updatePixels();
    m += 0.005;
  }
  
  
}
