void setup() {
 size(320,240);
 background(240); 
}

class PVector {
  float x;
  float y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
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
}

PVector location = new PVector(100.0, 100.0);
PVector velocity = new PVector(1.1, 3.3);

void draw() {
  background(240);
  location.add(velocity);
  
  if (location.x > width) {
    location.x = width;
    velocity.x = velocity.x *-1;
    
  } else if ( location.x < 0 ) {
    location.x = 0;
    velocity.x = velocity.x *-1;
  }
  
  if (location.y > height) {
    location.y = height;
    velocity.y = velocity.y * -1;
    
  } else if ( location.y < 0 ) {
    location.y = 0;
    velocity.y = velocity.y*-1;
  }
  

  stroke(0);
  fill(176);
  ellipse(location.x, location.y,32,32);

  
} 


