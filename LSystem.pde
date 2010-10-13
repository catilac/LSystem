class LSystem {
  String _start;
  HashMap _rules = new HashMap();
  Point a, b, dir; 
  int angle;

  LSystem(int steps, float xpos, float ypos) {
    _start = "F";
  
  // other goodies  
  // "F+FF-+F"
  // "F+FF−F−F+F"
    _rules.put("F", "F+FF−F−F+F");
    angle = 0;
    a = new Point(xpos, ypos);
    b = new Point(0, 0);
    dir = new Point(1, 0);

    for(int i = 0; i < steps; i++) {
      evolve();
    }
  }

  void evolve() {
    String evolution = "";
    for(int i = 0; i < _start.length(); i++) {
      char letter = _start.charAt(i);
      switch(letter) {
      case 'F':
        evolution += _rules.get("F");
        break;
      default:
        evolution += letter;
        break;
      }
    }
    _start = evolution;
  }

  void display() {
    for(int i = 0; i < _start.length(); i++) {
      char letter = _start.charAt(i);
      switch(letter) {
      case 'F':
        drawTo();
        break;
      case '-':
        rotateRight();
        break;
      case '+':
        rotateLeft();
        break;
      }
    }
    
  }

  void drawTo() {
    b.x = a.x + dir.x*10;
    b.y = a.y + dir.y*10;
    line(a.x, a.y, b.x, b.y);
    a.x = b.x; 
    a.y = b.y;
  }

  void rotateLeft() {
    angle -= 90;
    if(angle >= 360 || angle <= -360) {
      angle = 0;
    }

    dir.x = cos(radians(angle));
    dir.y = sin(radians(angle));
  }

  void rotateRight() {
    angle += 90;
    if(angle >= 360 || angle <= -360) {
      angle = 0;
    }
    dir.x = cos(radians(angle));
    dir.y = sin(radians(angle));
  }
}

