class Walker {
  int x;
  int y;
  Walker() {
    x = width/2;
    y = height/2;
  }
  void display() {
    stroke(0); // set stroke color to black
    point(x,y);
  }
 void update () {
   int chance = int(random(4));
   if (chance == 0) {
    x++;
   }
   if (chance == 1) {
    x--;
   }
   if (chance == 2) {
     y++;
   }
   if (chance == 3) {
     y--;
   }
   
 //x += random(-1,1) * 1;
 //y += random(-1,1) * 1;
 } 
}

Walker w;

void setup() {
  background(255,255,255);
  size(600,400); 
  w = new Walker();
}
void draw() {
  w.update();
  w.display();  
}
