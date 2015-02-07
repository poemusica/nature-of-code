class Liquid {
  float coefficient;
  float w, h, x, y;
  
  Liquid() {
    coefficient = 0.1;
    w = width;
    h = height/3;
    x = 0;
    y = height - h;
  }
  
  PVector calcDrag(Mover m) {
    PVector d = m.vel.get();
    float s = d.mag();
    d.normalize();
    d.mult(sq(s) * -coefficient);
    
    return d;
  }
  
  void display() {
    fill(0);
    rect(x, y, w, h);
  }
}
