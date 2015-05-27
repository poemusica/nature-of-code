String s;

void setup() {
  size(640, 360);
  s = generateString();
}

void draw() {
  background(175);
  textSize(32);
  fill(0, 102, 153);
  text(s, width * 0.4, height/2);
}

String generateString() {
  StringBuffer sb = new StringBuffer("");
  int len = (int) random(1, 10);
  for (int i = 0; i < len; i++) {
    char c = (char)(int)random(97, 123);
    sb.append(c);
  }
  String s = sb.toString();
  return s;
}

void mouseClicked() {
  s = generateString();
}
