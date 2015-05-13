String current = "A";
int count = 0;

void setup() {
  println("Gen " + count + ": " + current);
}

void draw() {
}

void mousePressed() {
  StringBuffer next = new StringBuffer();
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      next.append("AB");
    } else if (c == 'B') {
      next.append("A");
    }
  }
  current = next.toString();
  count++;
  println("Gen " + count + ": " + current);
}
