void setup() {
  size(640, 360);
  background(255);
  fill(150);
  text("Click to generate tree.", 10, 30);
}

void draw() {
}

void mouseClicked() {
  background(255);
  fill(150);
  text("Click to generate tree.", 10, 30);
  translate(width/2, height);
  stroke(0);
  branch(60, 4);
}

void branch(float len, float weight) {
  strokeWeight(weight);
  line(0, 0, 0, -len);
  
  if (len > 5) {
    translate(0, -len);
    int n = int(random(1, 4));
    for (int i = 0; i < n; i++) {
      float w = constrain(random(0.5, weight*0.9), 0.5, weight*0.9);
      float l = random(5, len*0.9);
      float theta = random(-PI/3, PI/3);
      pushMatrix();
      rotate(theta);
      branch(l, w);
      popMatrix();
    }
  }
}
