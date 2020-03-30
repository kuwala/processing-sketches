int xx = 1;
int yy = 1;
int rsize = 30;
int hue = 0;
void setup() {
  size(100,100);
  
}
void drawRect() {
  hue = (hue + 1 ) % 360;
 color c = color(hue, 360, 360);
 xx = (xx + 1) % width;
 yy = (yy + 1 ) % height;
 fill(c);
 rect(xx,yy,rsize,rsize);
}

void draw() {
 background(0,0,0,0.01);
 rotate(PI/16);
 for ( int i = 0; i <3; i ++ ) {
 
 rotate(PI/16);
 drawRect();
 }
 
}