class Data {
  String name;
  float initial, value, min, max;
  
  Data(String _name, float _initial, float _min, float _max) {
    name = _name;
    initial = _initial;
    value = initial;  
    min = _min;
    max = _max;
  }
}

class UI {
  ArrayList<Data> slideData;
  float w, h, margin, maxcols;
  
  UI() {
    slideData = new ArrayList<Data>();
    w = 100; // width of slider
    h = 25; // height of slider
    margin = 10; // x and y margins
    maxcols = floor(width/(w+margin));
  }
  
  void addSlideData(Data data) {
    slideData.add(data);
  }
  
  boolean isInside(PVector point, PVector boundA, PVector boundB) {
    if (point.x > max(boundA.x, boundB.x) || point.x < min(boundA.x, boundB.x)
    || point.y > max(boundA.y, boundB.y) || point.y < min(boundA.y, boundB.y)) {
      return false;
    }
    return true;
  }
  
  void update() {
    for (int i = 0; i < slideData.size(); i++) {
      Data data = slideData.get(i);
      float col = i % maxcols;
      float xmargin = margin + (col*w) + (col*margin);
      float ymargin = margin + ((margin+h) * floor(i/maxcols));
      PVector topcorner = new PVector(xmargin, ymargin);
      PVector botcorner = new PVector(xmargin + w, ymargin + h);
      PVector mouse = new PVector(mouseX, mouseY);
      if (isInside(mouse, topcorner, botcorner)) {
        data.value = map(mouse.x, topcorner.x, botcorner.x, data.min, data.max);
        println(data.value);
      }
    }
  }
  
  void display() {
    rectMode(CORNER);
    stroke(0);
    for (int i = 0; i < slideData.size(); i++) {
      Data data = slideData.get(i);
      pushMatrix();
      float col = i % maxcols;
      float xmargin = margin + (col*w) + (col*margin);
      float ymargin = margin + ((margin+h) * floor(i/maxcols));
      translate(xmargin, ymargin);
      noFill();
      rect(0, 0, w, h);
      fill(0);
      rect(0, 0, map(data.value, data.min, data.max, 0, w), h);
      text(data.name, 2, margin + h);
      text(data.value, w/2 + 10, margin + h);
      popMatrix();
    }
  }
}
