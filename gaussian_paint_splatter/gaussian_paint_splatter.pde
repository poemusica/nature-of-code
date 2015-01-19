// Consider a simulation of paint splatter drawn as a collection of colored dots. 
// Most of the paint clusters around a central location, but some dots do splatter out towards the edges.
// Can you use a normal distribution of random numbers to generate the locations of the dots?
// Can you also use a normal distribution of random numbers to generate a color palette?

import java.util.Random;
Random generator;

void setup(){
  size(640, 360); // middle 320, 180
  background(0);
  generator = new Random();
}

void draw(){
  float xnum = (float) generator.nextGaussian();
  float ynum = (float) generator.nextGaussian();
  float rval = (float) generator.nextGaussian();
  float gval = (float) generator.nextGaussian();
  float bval = (float) generator.nextGaussian();
  
  float sd = 60;
  float xmean = 320;
  float ymean = 180;
  float cmean = 127; // half of 255
  
  float x = sd * xnum + xmean;
  float y = sd * ynum + ymean;
  float r = sd * rval + cmean;
  float g = sd * gval + cmean;
  float b = sd * bval + cmean;
  noStroke();
  fill(r, g, b, 127);
  ellipse(x, y, 16, 16);
  
  
}
