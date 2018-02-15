void setup() {
  size( 600, 600, P3D);
  background(255,255,200);
}

void drawGrid(float _x, float _y, float _t) {
  fill(127);
  float t = _t; //time for anim
  float x = _x;
  float y = _y;
  float size = 20; // size = width = height // its the cell size
  int rowsMax = 20;
  int colsMax = 20;
  float ns = 0.1; // noise scale
  for(int row = 0; row < rowsMax; row++) {
    for (int col = 0; col < colsMax; col++) {
      float n = noise( col*ns + t, row*ns + t);
      float z = map(n,0,1,0,size*7);
      //z = 40;
      beginShape();
        vertex(x + col*size, y + row*size, z );
        vertex(x + col*size + size, y + row*size, z);
        vertex(x + col*size + size, y + row*size + size, z);
        vertex(x + col*size, y + row*size + size, z);
        vertex(x + col*size, y + row*size, z);
      endShape();
    }  
  } 
}

float angle = 45;
float time = 0;
float timeStep = 0.005;
void draw() {
  background(255,255,200);
  
  //rect(20,20,30,60);
  
  //translate(width/2, height/2);
  translate(width/2,height/2);
  rotateX(radians(angle));
  //line(0,0,width,height);
  translate(-1*width/3,-1*width/3);
  drawGrid(0,0,time);
  time += timeStep;
   //angle += 0.5;
}
