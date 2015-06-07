import java.util.Iterator;

LSystem plant;

void setup() {
  size(800, 460);
  plant = new LSystem(height/3, radians(25), "X");
}

void draw() {
 background(#743324); // maple
 stroke(#7B8039); // kelp
 pushMatrix();
 translate(width/2, height);
 plant.grow();
 plant.display();
 popMatrix();
}
