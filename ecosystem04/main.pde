import java.util.Iterator;
HopperSystem hsys;

void setup(){
  size(640, 360);
  background(255);
  hsys = new HopperSystem(new PVector(width/2, height/2));
}

void draw(){
  background(255);
  hsys.run();
}

void mouseClicked() {
  hsys.addCreature(new PVector(mouseX, mouseY));
}
