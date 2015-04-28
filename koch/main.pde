KochList koch;

void setup() {
  size(640, 360);
  
  koch = new KochList(new PVector(0, 200), new PVector(width, 200));
  for (int i = 0; i < 5; i++) {
    koch.generate();
  }
}

void draw() {
  background(255);
  for (KochLine k : koch.lines) {
    k.display();
  }
}
