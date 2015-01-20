class GaussianGraph{
  float oldx;
  float oldy;
  float newx;
  float newy;
  float mean;
  float sd;
  
  GaussianGraph(){
    mean = width/2;
    sd = width/12;
    
    oldx = 0;
    oldy = getY(oldx);
    newx = 1;
    newy = getY(newx);
    
  }
  
  float getY(float x){ 
    float pwr = -0.5 * sq(((x-mean)/sd));
    float y = (1 / (sd * sqrt(TWO_PI))) * exp(pwr);
    return (-(width*height)/8 * y) + height*0.75;
  }
  
  void display(){
    stroke(255, 0, 0);
    //point(newx, newy);
    line(oldx, oldy, newx, newy);
    println(oldx, oldy, newx, newy);
  }
  
  void plot(){
    oldx = newx;
    oldy = newy;
    
    newx += 10;
    newy = getY(newx); //* -200 + width/2;
  }
}

