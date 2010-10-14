class LSystem {
  String _initial_start;
  String _start;
  int _steps;
  HashMap _rules = new HashMap();
  Point a, b, dir; 
  int angle;

  LSystem(int steps, float xpos, float ypos) {
    _initial_start = "FX";
    _start = _initial_start;
    _steps = steps;
    // other goodies  
    // "F+FF-+F"
    // "F+FF−F−F+F"
    _rules.put("X", "X*YF");
    _rules.put("Y", "FX*Y");
    angle = 0;
    a = new Point(xpos, ypos);
    b = new Point(0, 0);
    dir = new Point(1, 0);

    for(int i = 0; i < steps; i++) {
      evolve();
    }
  }

  void reset() {
    _start = _initial_start;
    for(int i = 0; i < _steps; i++) {
      evolve();
    }
  }

  void evolve() {
    String evolution = "";
    for(int i = 0; i < _start.length(); i++) {
      char letter = _start.charAt(i);
      switch(letter) {
      case 'X':
        evolution += _rules.get("X");
        break;
      case 'Y':
        evolution += _rules.get("Y");
        break;
      case '*':
        evolution += randomMove();
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

  char randomMove() {
    float p = random(100);
    if (p > 46) return '+';
    return '-';
  }

  void drawTo() {
    b.x = a.x + dir.x*10;
    b.y = a.y + dir.y*10;
    Point m = new Point((a.x+b.x)/2, (a.y+b.y)/2);
    float r = random(1,7);
    strokeWeight(r);
    line(a.x, a.y, m.x, m.y);
    r = random(1,5);
    strokeWeight(r);

    line(m.x, m.y, b.x, b.y);
    a.x = b.x; 
    a.y = b.y;
  }

  void rotateLeft() {
    angle -= random(-90, 90);
    //    angle -= 90;
    if(angle >= 360 || angle <= -360) {
      angle = 0;
    }

    dir.x = cos(radians(angle));
    dir.y = sin(radians(angle));
  }

  void rotateRight() {
    angle += random(-90,90);
    //    angle += 90;
    if(angle >= 360 || angle <= -360) {
      angle = 0;
    }
    dir.x = cos(radians(angle));
    dir.y = sin(radians(angle));
  }
}

