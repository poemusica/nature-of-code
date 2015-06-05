import java.util.Arrays;

Population pop;
boolean stop;

void setup() {
  size(800, 480);
  pop = new Population(7);
  stop = false;
}

void draw() {
  background(175);
  pop.display();
  
  pop.userScore(new PVector(mouseX, mouseY));
//  if (frameCount % 1 == 0 && stop == false) {
//    pop.evolve();
//  }
}

void mouseClicked() {
  pop.evolve();
//  stop = ! stop;
}
