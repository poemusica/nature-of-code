class Wave {
  Oscillator[] oscillators;
  
  Wave() {
    oscillators = new Oscillator[50];
    float offset = 0;
    for (int i = 0; i < oscillators.length; i++) {
      offset = i * (2 * TWO_PI / oscillators.length);
      oscillators[i] = new Oscillator(offset);
    }
  }
  
  void display() {
    for (int i = 0; i < oscillators.length; i++) {
      Oscillator osc = oscillators[i];
      osc.oscillate();
      osc.display();
    }
  }
  
}
