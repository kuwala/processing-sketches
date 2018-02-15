void setup() {
  size (680, 680, P3D);
  background(100);
  //rectMode(CENTER);
//move into place
frameRate(1);
rotate(PI/2 * -1);
noStroke();
}



/*
fill(random(255),random(255),random(255));
rect(0,0,90,10);
rotate(PI/8);
fill(random(255),random(255),random(255));
rect(0,0,90,10);
*/
/*
int max = 16;
for (int i = 0 ; i < max; i++) {
  rotate( (PI/8 ));
  fill(random(255),random(255),random(255));
  rect(0,0,92,20);
  text(i, 90, 0);
  
} */

int i = 0;
int armLen = 300;
int transPadX = -40;
int transPadY = -10;
void draw() {
  //rectMode(CENTER);
  pushMatrix();
  translate(width/2,height/2);
  color t = color(160,160,160, 48 );
  fill(t);
  ellipse(0,0, armLen*2, armLen*2);
  rotate( ( (PI/30 ) * i)- HALF_PI);
  translate( transPadX, transPadY);
  color c = color(random(255),random(255),random(255));
  fill(c);
  rect(0,0,armLen,20);
  fill(20);
  rect(armLen,0,40, 20);
  fill(c);
  text(i, armLen+8, 0 + 14);
  
  
  popMatrix();
  fill(20);
  
  rect(width/2 - 30, height/2 , 60, 20);
  fill(c);
  text(i, width/2 - 30 + 14, height/2 + 14);
  i ++;
}
