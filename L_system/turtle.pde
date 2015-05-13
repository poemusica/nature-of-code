class Turtle {
  
  Turtle() {
  }
  
  void render(String sentence, float len, float theta) {
    for (int i = 0; i < sentence.length(); i++) {
      char c = sentence.charAt(i);
      switch (c) {
        case 'F':
          line(0, 0, 0, -len);
          translate(0, -len);
          continue;
        case 'G':
          translate(0, -len);
          continue;
        case '+':
          rotate(theta);
          continue;
        case '-':
          rotate(-theta);
          continue;
        case '[':
          pushMatrix();
          continue;
        case ']':
          popMatrix();
          continue;
      }
    }
  }
}
