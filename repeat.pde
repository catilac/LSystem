LSystem system;

void setup() {
  size(800,800);
  smooth();
  stroke(0);
  system = new LSystem(13,width/2,height/2);
  background(255, 255, 255);
  stroke(0);
}

void draw() {  
  system.display();
}
