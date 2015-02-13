Oscillator[] oscillators;

void setup() {
  size(640, 360);
  oscillators = new Oscillator[11];
  for (int i = 0; i < oscillators.length; i++) {
    oscillators[i] = new Oscillator(i * (TWO_PI / (oscillators.length)));
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
