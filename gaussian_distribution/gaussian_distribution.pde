// GLOBALS
import java.util.Random;

Random generator;

void setup(){
  size(640, 360);
  generator = new Random(); // uses Java random library. returns a double.
}

void draw(){
  float num = (float) generator.nextGaussian();
  float sd = 60; // standard deviation
  float mean = 320;
  
  float x = sd * num + mean;
  
  noStroke();
  fill(255, 10);
  ellipse(x, 180, 16, 16);
}



