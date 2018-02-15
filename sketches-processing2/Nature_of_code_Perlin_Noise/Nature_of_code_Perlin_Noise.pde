void setup() {
  size(400,600); 
}


float t = 0;

void draw() {


  float oldY = 0;
  float newY = 0;
  float x = 1;
  float xcenter = width/2;
  float ycenter = height/2;
  float t = 0;
  for (int i = 0; i < width; i ++ ) {
    float n = noise(t);
    oldY = newY;
    newY = ycenter + ( n * 127 ) + -65;
    line(x * i,oldY,x * i,newY);
    t += 0.01;
  }
  //delay(20);
  
  //background(255);
  
}
