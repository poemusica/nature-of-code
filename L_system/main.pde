LSystem Lsys;
RuleSet rules;
Turtle renderer;

void setup() {
  size(640, 360);
  Lsys = new LSystem("F", width/6, radians(25));
  rules = new RuleSet();
  renderer = new Turtle();
}

void draw() {
 background(255);
 translate(width/2, height);
 renderer.render(Lsys.sentence, Lsys.len, Lsys.theta); 
}

void mouseClicked() {
  Lsys.scaleLen(0.5);
  Lsys.sentence = rules.applyRules(Lsys.sentence);
}
