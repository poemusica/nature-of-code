class Insect {
  Oscillator[] oscillators;
  PVector loc, vel, acc;
  float w, h;

  Insect() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    w = 50;
    h = 50;
    oscillators = new Oscillator[10];
    float x = -w/2;
    float y = -h/2;
    float angR = -PI;
    float step = h / ((oscillators.length - 1) / 2);
    for (int i = 0; i < oscillators.length; i++) {
      if (i == oscillators.length/2) {
        x = w/2;
        y = -h/2;
        angR = PI;
      }
      oscillators[i] = new Oscillator(x, y + step * (i % (oscillators.length / 2)), angR);
    }
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    acc = PVector.sub(mouse, loc);
    float d = acc.mag();
    acc.normalize();
    acc.mult(d/10000);
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);
    wrap();
  }
  
  void display() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading() + PI/2);
    for (int i = 0; i < oscillators.length; i++) {
      Oscillator osc = oscillators[i];
      osc.oscillate(acc);
      osc.display();
    }
    acc.mult(0);

    fill(175);
    rect(0, 0, w, h + 50, 7);
    popMatrix();
  }
  
  void wrap(){
    if (loc.x > width + h/2){
      loc.x = 0;
    }
    if (loc.x < -h/2){
      loc.x = width;
    }
    if (loc.y > height + h/2){
      loc.y = 0;
    }
    if (loc.y < -h/2){
      loc.y = height;
    }
  }
  
  
}
