LSystem system;

void setup() {
  size(1440,900);
  smooth();
  stroke(0);
  system = new LSystem(14,width/2,height/2);
  background(255, 255, 255);
}

void draw() {
  system.display();
  saveFrame("random-####.tif");
  exit();
}

