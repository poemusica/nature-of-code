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
  ArrayList<Data> pieData;
  float w, h, r, margin, xLimit, maxcols;
  
  UI() {
    slideData = new ArrayList<Data>();
    pieData = new ArrayList<Data>();
    w = 100; // width of slider
    h = 25; // height of slider
    r = 25;
    margin = 15; // x and y margins
    xLimit = width - (2*margin + max(2*r, w));
    maxcols = floor(xLimit/(w+margin));
  }
  
  void addPieData(Data data) {
    pieData.add(data);
  }
  
  void addSlideData(Data data) {
    slideData.add(data);
  }
  
  boolean isInsideCircle(PVector point, PVector center, float radius) {
    if (PVector.dist(point, center) > radius) {
      return false;
    }
    return true;
  }
  
  boolean isInsideRect(PVector point, PVector boundA, PVector boundB) {
    if (point.x > max(boundA.x, boundB.x) || point.x < min(boundA.x, boundB.x)
    || point.y > max(boundA.y, boundB.y) || point.y < min(boundA.y, boundB.y)) {
      return false;
    }
    return true;
  }
  
  void updatePies() {
    float x = xLimit + r + margin;
    PVector v = new PVector(r, 0);
    PVector mouse = new PVector(mouseX, mouseY);
    for (int i = 0; i < pieData.size(); i++) {
     Data data = pieData.get(i);
     float y = margin/2 + r + ((margin/2 + r*2) * i);
     PVector center = new PVector(x, y);
     if (isInsideCircle(mouse, center, r)) {
       PVector m = PVector.sub(mouse, center);
       m.setMag(r);
       float theta = PVector.angleBetween(m, v);
       if (m.y >= 0) { theta = TWO_PI - theta;}
       data.value = (theta/2);
       break;
     }
   } 
  }
  
  void updateSliders() {
    PVector mouse = new PVector(mouseX, mouseY);
    for (int i = 0; i < slideData.size(); i++) {
      Data data = slideData.get(i);
      float col = i % maxcols;
      float xmargin = margin + (col*w) + (col*margin);
      float ymargin = margin + ((margin+h) * floor(i/maxcols));
      PVector topcorner = new PVector(xmargin, ymargin);
      PVector botcorner = new PVector(xmargin + w, ymargin + h);
      if (isInsideRect(mouse, topcorner, botcorner)) {
        data.value = map(mouse.x, topcorner.x, botcorner.x, data.min, data.max);
        break;
      }
    }
  }
  
  void displayPies() {
    textSize(10);
    float x = xLimit + r + margin;
    float alpha = 45;
    for (int i = 0; i < pieData.size(); i++) {
     Data data = pieData.get(i);
     float y = margin/2 + r + ((margin/2 + r*2) * i);
     PVector v = new PVector(r, 0);
     pushMatrix();
     translate(x, y);
     stroke(0);
     noFill();
     ellipse(0, 0, r*2, r*2);
     fill(0, 0, 0, alpha);
     noStroke();
     arc(0, 0, r*2, r*2, TWO_PI - data.value*2, TWO_PI, PIE);
     fill(0);
     text(data.name, r + margin/2, -r, r + margin*2 , margin*2);
     text(round(degrees(data.value*2))+" deg", r + margin/2, r*0.85);
     popMatrix();
     alpha += 45;
   } 
  }
  
  void displaySliders() {
    rectMode(CORNER);
    stroke(0);
    textSize(10);
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
      text(data.name, 2, margin + h*0.85);
      text(data.value, w/2 + 10, margin + h*0.85);
      popMatrix();
    }
  }
  
  void update() {
    updateSliders();
    updatePies();
  }
  
  void display() {
    displaySliders();
    displayPies();
    //debug
//    stroke(0);
//    line(xLimit, 0, xLimit, height);
  }
}
