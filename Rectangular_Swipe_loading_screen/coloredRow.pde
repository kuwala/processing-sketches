class ColoredRow {
 float hue;
 float sat;
 int distance;
 int size;
 float angle;
 float phase;
 float speed;
 int x = 0;
 int y = 0;
 
 ColoredRow(int xx, int yy, int ssize, int ddistance, float pphase) {
   x = xx;
   y = yy;
   size = ssize;
   distance = ddistance;
   phase = pphase;
   speed = 0.1;
   sat= 0;

 }
   
   
 
 void draw() {
    
  int xx = round(sin(angle+phase) * (width/2+(size)) + width/2 );
  if(xx < 3 || xx > width-3 ) {
    hue = ((hue + 10)%256);
    //sat = ((sat+ 10)%256);
  }
  fill(color((int)hue,(int)sat,255));
  hue = hue+0.1 % 256;
  sat = sat+0.1%256;
  
  
  angle += 0.03;
  rectMode(CENTER);
  rect(xx,y+size/2,size,size);
 }
  
  
}