void wallCheck(Balloon n){
  boolean hit = false;
  float wconstant = 1.6;
  PVector wallforce = new PVector(0, 0);
  
  if (n.loc.y <= 0 + n.h/2.0){
    n.loc.y = 0 + n.h/2;
    wallforce.y = -n.vel.y;
    hit = true;
  }
  if (n.loc.y >= height - n.h/2.0){
    n.loc.y = height - n.h/2;
    wallforce.y = -n.vel.y;
    hit = true;
  }
  if (n.loc.x <= 0 + n.w/2.0){
    n.loc.x = 0 + n.w/2;
    wallforce.x = -n.vel.x;
    hit = true;
  }
  if (n.loc.x >= width - n.w/2.0){
    n.loc.x = width - n.w/2;
    wallforce.x = -n.vel.x;
    hit = true;
  }

  if (hit == true){
    wallforce.mult(wconstant);
    n.applyForce(wallforce);
  }
}
