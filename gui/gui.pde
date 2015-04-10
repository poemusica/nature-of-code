void (mouseDragged) {
  //update UI using mouse coords
}
class UI {
  //slider list
  UI() {}
  
  void addSlider() {
  }
  
  void isInside() {
    // inputs: rect info, point
    //returns a boolean
  }
  
  void update() {
    // for each slider, calculate its rect and 
    //check if the mouse is inside.
    //if it is, map mouse-x to the value range. 
    //and set the value. then update the slider. 
  }
  
  void display() {
    //for each slider in the sliders list, draw a rect of a certain size.
    //draw a rect indicating the level (map its value to the size)
    //draw its name somewhere too.
    //if you run out of horiz space, increase y.
  }
}

class Slider {
  //name, value, setter
  Slider() {
    //pass in weight object here
    //call weight getter to get initial value
  }
  
  void update() {
    //call weight setter to match with value
  }
  
}
