class Oscillator {

  PVector loc, angles;
  PVector aVelocity, aAcceleration;
  PVector amplitude;
  float angR, xoff, yoff, sign;

  Oscillator(float _x, float _y, float _angR) {
    angR = _angR;
    loc = new PVector(_x, _y);
    angles = new PVector();
    aVelocity = new PVector(0.15, 0.15);
    aAcceleration = new PVector(0, 0);
    amplitude = new PVector(5, 10);
    sign = abs(loc.x)/loc.x;
    xoff = random(-PI, PI);
    yoff = random(-PI, PI);
  }

  void oscillate() {
    aVelocity.add(aAcceleration);
    angles.add(aVelocity);
    aAcceleration.mult(0);
  }

  void display() {
    float x = sin(angles.x + xoff);
    loc.x = map(x, -1, 1, 0, amplitude.x * sign);
    
    float y = sin(angles.y + yoff);
    y = map(y, -1, 1, -amplitude.y * sign, amplitude.y * sign);

    pushMatrix();
    translate(width/2, height/2);
    rotate(angR);
    stroke(0);
    line(0, loc.y, loc.x + (sign * 50), loc.y + y);
    ellipse(loc.x + (sign * 50), loc.y + y, 16, 16);
    popMatrix();
  }
}

