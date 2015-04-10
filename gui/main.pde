UI controls;
Test test;

void setup() {
  size(640, 360);
  test = new Test();
  controls = new UI();
  controls.addSlideData(test.scaleView);
  controls.addSlideData(test.scaleSep);
  controls.addSlideData(test.scaleCoh);
  controls.addSlideData(test.scaleAli);
}

void draw() {
  background(255);
  controls.display();
}

void mouseDragged() {
  controls.update();
}
