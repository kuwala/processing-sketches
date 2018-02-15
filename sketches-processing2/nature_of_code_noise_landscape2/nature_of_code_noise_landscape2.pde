void setup() {
  size( 600, 600, P3D);
  smooth(8);
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
  float zMax = size*7;
  for(int row = 0; row < rowsMax; row++) {
    for (int col = 0; col < colsMax; col++) {
      
      // n1, n2, n3,n4, n1
      // vertecis z values
      // for each cell
      //
      //     1 -> 2
      //     ^    V
      //     4 <- 3
 
      
      float n1 = noise( col*ns + t, row*ns + t);
      float n2 = noise(col*ns + ns + t, row*ns + t);
      float n3 = noise(col*ns + ns + t, row*ns + ns + t);
      
      float n4 = noise(col*ns + t, row*ns + ns + t);
      
      float z1 = map(n1, 0, 1, 0, zMax);
      float z2 = map(n2, 0, 1, 0, zMax);
      float z3 = map(n3, 0, 1, 0, zMax);
      float z4 = map(n4, 0, 1, 0 ,zMax);
      fill(map(n1,0,1,0,120),map(n2,0,1, 0,170),map(n3,0,1,0,255));
      beginShape();
        vertex(x + col*size, y + row*size, z1 );
        vertex(x + col*size + size, y + row*size, z2);
        vertex(x + col*size + size, y + row*size + size, z3);
        vertex(x + col*size, y + row*size + size, z4);
        vertex(x + col*size, y + row*size, z1);
      endShape();
    }  
  } 
}

float angle = 45;
float time = 0;
float timeStep = 0.005;
void draw() {
  background(40,80,200);
  
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
