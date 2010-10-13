LSystem koch;

void setup() {
  size(800,800);
  smooth();
  stroke(0);
  koch = new LSystem(4,0,height/2);
  background(255, 255, 255);
  stroke(0);
}

void draw() {  
  koch.display();
}
