
static class PVector {
  float x;
  float y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  static PVector add(PVector v1, PVector v2) {
    PVector v3 = new PVector(v1.x + v2.x, v1.y + v2.y);
    return v3;
  }
  
  static PVector mult(PVector v1, float n) {
    PVector v2 = new PVector(v1.x * n, v1.y * n);
    return v2;
  }
  
  static PVector sub(PVector v1, PVector v2) {
    PVector v3 = new PVector(v1.x - v2.x, v1.y - v2.y);
    return v3;
  }
  
  static PVector div(PVector v1, float n) {
    PVector v3 = new PVector(v1.x /n, v1.y /n);
    return v3;
  }
  
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }

  void sub(PVector v) {
    x = x - v.x;
    y = y - v.y;
  }
  void mult(float n) {
    x = x * n;
    y = y * n;
  }
  void div(float n) {
    x = x / n;
    y = y / n;
  }
  float mag() {
    return sqrt(x*x + y*y);
  }
  void normalize(){
    float m = mag();
    if (m != 0) {
      div(m);
    }
  }
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
      }
  }
}