// GLOBALS
RandomCounter randc;

void setup(){
  size(640, 240);
  randc = new RandomCounter();
}

void draw(){
  background(255);
  
  randc.randomIncrease();
  
  stroke(0);
  fill(175);
  
  randc.randomGraph();
}

class RandomCounter{
  int[] randomCounts;
  int w;
  
  RandomCounter(){
    randomCounts = new int[20];
    w = width/randomCounts.length;
  }
  
  void randomIncrease(){
    int index = int(random(randomCounts.length));
    randomCounts[index]++;
  }
  
  void randomGraph(){
    for (int x = 0; x < randomCounts.length; x++){
      rect(x*w, height - randomCounts[x], w-10, randomCounts[x]);
    }
  }
  
}

