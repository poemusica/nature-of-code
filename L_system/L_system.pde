class LSystem {
  String sentence;
  float len, theta;
  
  LSystem(String axiom, float _len, float _theta) {
    sentence = axiom;
    len = _len;
    theta = _theta;
  }
  
  void changeTheta() {
    theta += map(noise(frameCount/1000, millis()/1000), 0, 1,  radians(-0.1), radians(0.1));
    theta = constrain(theta, PI/12, PI/6);
  }
  
  void scaleLen(float n) {
    len *= n;
  }
}
