void windCondition(Balloon n){
  if (mousePressed){
    float wx = map(noise(n.loc.x/10, (frameCount % 10)/10), 0, 1, -0.1, 0.1);
    float wy = map(noise(n.loc.y/10, (frameCount % 10)/10), 0, 1, -0.1, 0.1);
    PVector wind = new PVector(wx, wy);

    n.applyForce(wind);
  }
}
