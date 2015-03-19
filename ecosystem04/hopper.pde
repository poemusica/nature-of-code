class Hopper extends Mover{
  Oscillator oscR;
  Oscillator oscL;
  
  Hopper(PVector _loc){
    super(_loc);
    topspeed = 2;
    size = 50; // to randomize this, change display values to be relative
    oscR = new Oscillator();
    oscL = new Oscillator();
  }
  
  void update(){
    if (frameCount % 100 == 1){
      PVector mouse = new PVector(mouseX, mouseY);
      acc = PVector.sub(mouse, loc);
      acc.normalize();  
      vel.add(PVector.mult(acc, topspeed));
    }
    else {
      vel.add(PVector.mult(acc, -topspeed/100));
    }
    
    vel.limit(topspeed);
    loc.add(vel);
    wrap();
    
    float scalar = vel.mag() / topspeed;
    oscR.aVelocity = vel.mag() * 0.3;
    oscR.range.set(PI/4 * scalar, -PI/4 * scalar);
    oscR.oscillate();
    
    oscL.aVelocity = vel.mag() * 0.3;
    oscL.range.set(-PI/4 * scalar, PI/4 * scalar);
    oscL.oscillate();
  }
  
  void display(){
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading()); // frame of reference: body faces to the right
    
    // draw body
    noStroke();
    fill(200, 235, 0);
    ellipse(0, 0, size, size);
    
    pushStyle();
    noFill();
    strokeWeight(5);
    stroke(200, 235, 0);
    pushMatrix(); // antenna
    translate(20, 10);
    rotate(-PI * 0.35);
    arc(0, 0, 10, 30, 0, PI/2);
    popMatrix();
    pushMatrix(); // antenna
    translate(20, -10);
    rotate(PI * 0.35);
    arc(0, 0, 10, 30, -PI/2, 0);
    popMatrix();
    popStyle();
    
    // draw right wing
    oscR.angR = PI/2 * 1.3; // wing orientation relative to body
    oscR.loc.set(5, 5); // wing point of attachment. x: front/back. y: close/far.
    fill(255, 0, 0);
    oscR.display();
    
    // draw left wing
    oscL.angR = -PI/2 * 1.3;
    oscL.loc.set(5, -5);
    fill(0, 0, 255);
    oscL.display();
    popMatrix();
  }
}
