Oscillator[] oscillators;

void setup() {
  size(640, 360);
  oscillators = new Oscillator[4];
  PVector temp = new PVector(0, 0.07);
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(temp.x, temp.y);
    temp.x *= -1;
    temp.set(temp.y, temp.x);
  }
}

void draw() {
  background(200);
  for (int i = 0; i < oscillators.length; i++) {
    Oscillator osc = oscillators[i];
    osc.oscillate();
    osc.display();
  }

}
