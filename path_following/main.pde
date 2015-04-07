Path path;
Vehicle vehicle;

void setup() {
  size(640, 360);
  path = new Path();
  vehicle = new Vehicle(new PVector(random(width), random(height)));
}

void draw() {
  background(255);
  path.display();
//  vehicle.wrap(path); // confines vehicle to track length
  vehicle.followPath(path);
  vehicle.update();
  
  vehicle.display();
}

PVector findNormalPt(PVector point, PVector lineStart, PVector lineEnd) {
  PVector toPoint = PVector.sub(point, lineStart); // a (hypotenuse)
  PVector toNorm = PVector.sub(lineEnd, lineStart); // b (we will adjust its mag next)
  toNorm.normalize();                // |b| = |a| * cos(theta), where theta is the angle between a and b 
  toNorm.mult(toPoint.dot(toNorm)); // |a| * |b| * cos(theta) = a dot b, and here |b| is 1!
  PVector normalPt = PVector.add(lineStart, toNorm);
  return normalPt; // add b to the start of the line to get the normal point
}
