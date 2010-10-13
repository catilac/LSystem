class Point {
  float x;
  float y;
  
  Point(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void assign(Point h) {
    x = h.x;
    y = h.y;
  }
  
}
