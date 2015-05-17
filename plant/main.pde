LSystem plantD, plantE, plantF;

void setup() {
  size(800, 460);
  plantD = new LSystem(height/3, radians(-20), "X");
  plantE = new LSystem(height/3, radians(25), "X");
  plantF = new LSystem(height/3, radians(-20), "X");
}

void draw() {
 background(#743324); // maple
 stroke(#7B8039); // kelp
 pushMatrix();
 translate(width * 0.25, height);
 plantD.display();
 popMatrix();
 pushMatrix();
 translate(width * 0.5, height);
 plantE.display();
 popMatrix();
 pushMatrix();
 translate(width * 0.75, height);
 plantF.display(); 
 popMatrix();
}

void mouseClicked() {
  plantD.generateD();
  plantE.generateE();
  plantF.generateF(); 
} 
