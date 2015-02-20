class Insect {
  Oscillator[] oscillators;
  float w, h;

  Insect() {
    w = 50;
    h = 100;
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
      println(x, y + step * (i % (oscillators.length / 2)));
    }
  }

  void display() {
    for (int i = 0; i < oscillators.length; i++) {
      Oscillator osc = oscillators[i];
      if (mousePressed == false && osc.aVelocity.y > 0.15) {
        osc.aAcceleration.set(0, -0.005);
      }
      if (mousePressed == true) {
        osc.aAcceleration.set(0, 0.0025); 
      }
      osc.oscillate();
      osc.display();
    }
    
    pushMatrix();
    translate(width/2, height/2);
    fill(175);
    rect(0, 0, w, h + 50, 7);
    popMatrix();
  }
}
