class LSystem {
  String sentence;
  float len, theta;
  
  LSystem(String axiom, float _len, float _theta) {
    sentence = axiom;
    len = _len;
    theta = _theta;
  }
  
  void scaleLen(float n) {
    len *= n;
  }
}
