class Mouse extends Mover {
  
  Mouse(PVector _loc) {
    super(_loc);
    fillcolor = new PVector(145, 145, 145);
  }
  
  PVector repel(Mover m) {
    PVector f = PVector.sub(m.loc, loc);
    float dist = f.mag();
    dist = constrain(dist, 10, width/3);
    f.setMag(200/sq(dist)); // repel strength = 200
    return f;
  }
  
  void update() {
    loc.set(mouseX, mouseY); 
  }
  
  void display(){
    pushMatrix();
    pushStyle();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    noStroke();
    fill(fillcolor.x, fillcolor.y, fillcolor.z, 145);
    ellipse(0, 0, size, size);
    popStyle();
    popMatrix();
  }
}
