void setup() {
  size(400,400);
  //fill(0,0,0);
  //rect(0,0,width,height);
  //img = loadImage("johnhead2.jpg");
  
}
float a = 0.0;
float xx = 0;
float yy = 0;
float r = 20;

void draw() {
  
  //fill(255,255,255,3);
  //rect(0,0,width,height);
  a += 0.1;
  xx = sin(a) * r;
  yy = cos(a) * r;
  fill(255,255,255);
 ellipse(20+xx+mouseX,20+yy+mouseY,20,20); 
 //image(img, xx +mouseX, yy+mouseY);
}