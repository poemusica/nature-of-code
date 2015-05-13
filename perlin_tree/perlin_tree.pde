float offR, offL;

void setup() {
  size(640, 360);
  offR = 0;
  offL = random(-100, 0);
}

void draw() {
  background(255);
  translate(width/2, height);
  stroke(0);
  branch(60, 4);
  offR += 0.05;
  offL += 0.05;
}

void branch(float len, float weight) {
  strokeWeight(weight);
  fill(0);
  line(0, 0, 0, -len);
  
  if (len > 5) {
    translate(0, -len);
    float theta = map(noise(offR, len), 0, 1,  0, PI/len);
    
    pushMatrix();
    rotate(PI/6 + theta);
    branch(len*0.66, weight*0.66);
    popMatrix();
    
    theta = map(noise(offL, len), 0, 1, 0, PI/len);
    pushMatrix();
    rotate(-PI/6 + theta);
    branch(len*0.66, weight*0.66);
    popMatrix();
  } else if (len <= 5) {
    pushMatrix();
    translate(0, -len);
    fill(175, 75);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }
}
