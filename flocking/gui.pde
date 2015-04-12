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

class Widget {
  Data data;
  PVector loc;
  color c;
  
  Widget(Data _data, PVector _loc, color _c) {
    data = _data;
    loc = _loc.get();
    c = _c;
  }
}

class UI {
  ArrayList<Widget> pieWidgets;
  ArrayList<Widget> slideWidgets;
  float w, h, r, margin, xLimit, maxCols;
  
  UI() {
    pieWidgets = new ArrayList<Widget>();
    slideWidgets = new ArrayList<Widget>();
    w = 100; // width of slider
    h = 25; // height of slider
    r = 25; // radius of pie
    margin = 15; // x and y margins
    xLimit = width - (2*margin + max(2*r, w));
    maxCols = floor(xLimit/(w+margin));
  }
  
  PVector getPieCoords() { // generates coords for a new pie widget
    int i = pieWidgets.size();
    float x = xLimit + r + margin;
    float y = margin/2 + r + ((margin/2 + r*2) * i);
    return new PVector(x, y);
  }
  
  PVector getSlideCoords() { // generates coords for a new slider widget
    int i = slideWidgets.size();
    float col = i % maxCols;
    float x = margin + (col*w) + (col*margin);
    float y = margin + ((margin+h) * floor(i/maxCols));
    return new PVector(x, y);
  }
  
  void addPieWidget(Widget widget) {
    pieWidgets.add(widget);
  }
  
  void addSlideWidget(Widget widget) {
    slideWidgets.add(widget);
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
    PVector v = new PVector(r, 0);
    PVector mouse = new PVector(mouseX, mouseY);
    for (int i = 0; i < pieWidgets.size(); i++) {
     Widget widget = pieWidgets.get(i);
     if (isInsideCircle(mouse, widget.loc, r)) {
       PVector m = PVector.sub(mouse, widget.loc);
       m.setMag(r);
       float theta = PVector.angleBetween(m, v);
       if (m.y >= 0) { theta = TWO_PI - theta;}
       widget.data.value = (theta/2);
       break;
     }
   } 
  }
  
  void updateSliders() {
    PVector mouse = new PVector(mouseX, mouseY);
    for (int i = 0; i < slideWidgets.size(); i++) {
      Widget widget = slideWidgets.get(i);
      PVector topcorner = widget.loc;
      PVector botcorner = new PVector(widget.loc.x + w, widget.loc.y + h);
      if (isInsideRect(mouse, topcorner, botcorner)) {
        widget.data.value = map(mouse.x, topcorner.x, botcorner.x, widget.data.min, widget.data.max);
        break;
      }
    }
  }
  
  void displayPies() {
    textSize(10);
    for (int i = 0; i < pieWidgets.size(); i++) {
     Widget widget = pieWidgets.get(i);
     PVector v = new PVector(r, 0);
     pushMatrix();
     translate(widget.loc.x, widget.loc.y);
     fill(widget.c);
     noStroke();
     arc(0, 0, r*2, r*2, TWO_PI - widget.data.value*2, TWO_PI, PIE);
     stroke(0);
     noFill();
     ellipse(0, 0, r*2, r*2);
     fill(0);
     text(widget.data.name, r + margin/2, -r, r + margin*2 , margin*2);
     text(round(degrees(widget.data.value*2))+" deg", r + margin/2, r*0.85);
     popMatrix();
   } 
  }
  
  void displaySliders() {
    rectMode(CORNER);
    stroke(0);
    textSize(10);
    for (int i = 0; i < slideWidgets.size(); i++) {
      Widget widget = slideWidgets.get(i);
      pushMatrix();
      translate(widget.loc.x, widget.loc.y);
      stroke(widget.c);
      fill(widget.c);
      rect(0, 0, map(widget.data.value, widget.data.min, widget.data.max, 0, w), h);
      noFill();
      stroke(0);
      rect(0, 0, w, h);
      fill(0);
      text(widget.data.name, 2, margin + h*0.85);
      text(widget.data.value, w/2 + 10, margin + h*0.85);
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
  }
}
