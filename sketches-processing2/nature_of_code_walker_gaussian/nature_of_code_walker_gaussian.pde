

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

PVector gaussVector(float min, float dist) {
  float x = randomGaussian();
  float y = randomGaussian();
  
  return new PVector( x * dist + min, y * dist + min ); 
  
}

class Walker {
  PVector last;
  PVector location;
  int x, y;
  Walker() {
    x = width/2;
    y = height/2;
    location = new PVector( width/2, height/2);
    last = new PVector( width/2, height/2);
  }
  void display() {
    stroke(0); // set stroke color to black
    int x = int(location.x);
    int y = int(location.y);
    //stroke(125);
    stroke(random(0,200));
    line(last.x ,last.y , location.x,location.y);
    //point(x,y);
    //println (last.x);
    
   // println(location.x);
  }
 void update () {
   int chance = int(random(4));
   //PVector newloc = new PVector(random(-2,2),random(-2,2));
   PVector newloc = gaussVector(0, 2);
   last.x = location.x;
   last.y = location.y;
   location.add(newloc);
   
 //x += random(-1,1) * 1;
 //y += random(-1,1) * 1;
 } 
}

Walker w;

void setup() {
  background(255,255,255);
  size(1400,900); 
  w = new Walker();
  smooth();
  frameRate(120);
}
void draw() {
  w.update();
  w.display();  
}
