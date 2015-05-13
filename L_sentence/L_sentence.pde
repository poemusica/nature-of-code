String current = "A";
int count = 0;
float len;

void setup() {
  size(640, 360);
  println("Gen " + count + ": " + current);
  len = width - 20;
}

void draw() {
  float x = 10;
  float y = 10 + 10 * count;
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      line(x, y, x + len/current.length(), y);
      x+= len/current.length();
    } else if (c == 'B') {
      x+= len/current.length();
    }
  }
}

void mousePressed() {
  StringBuffer next = new StringBuffer();
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      next.append("ABA");
    } else if (c == 'B') {
      next.append("BBB");
    }
  }
  current = next.toString();
  count++;
  println("Gen " + count + ": " + current);
}
