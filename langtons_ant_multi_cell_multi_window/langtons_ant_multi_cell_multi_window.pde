// Langtons Ant

// 2d Grid

// Ant mpves
/*sdfjkdf*/

import controlP5.*;

ControlP5 cp5;
int conColor = color(0,0,0);
int sliderValue = 50;
int slider2Value = 4;
Slider abc;

int rows = 80;
int cols = 80;
int [][] grid = new int[cols][rows];

int size = 10;

int x = cols/2;
int y = rows/2;
int dir = 0; // counter clockwise starting facing right
int cell = 0;
int generations = 4;

// rule definition
int numRules = 4;
char rules[] = {'L','R','R','L','R','R','L','L'};

void setup() {
  noStroke();
  frameRate(30);
  size(1200,800);
  cp5 = new ControlP5(this);
  cp5.addSlider("sliderValue")
     .setPosition(100,50)
     .setWidth(600)
     .setRange(1,500)
     ;
     
  cp5.addSlider("slider2Value")
     .setPosition(100,120)
     .setWidth(200)
     .setRange(1,8)
     .setNumberOfTickMarks(8)
     ;
  for (int i = 0; i < cols; i ++ ) {
     for (int j = 0; j < rows; j++) {
       //grid[i][j] = i % 2;
       //grid[i][j] = (((float)(j * cols )+ i ) / 100) * 255;
       grid[i][j] = 0;
     }
  }
}
void drawBoard() {
  for (int i = 0; i < cols; i ++ ) {
     for (int j = 0; j < rows; j++) {
       int cell = grid[i][j];
       if ( cell == 0 ) {
         fill(0);
       } else if ( cell == 1 ) {
         fill(0,127,255); 
       } else if (cell == 2 ) {
         //print("hello");
         fill(255,0,127); 
       } else if (cell == 3 ) {
         fill(127,255,0); 
       } else if ( cell == 4 ) {
         fill(0,127,0); 
       } else if (cell == 5 ) {
         //print("hello");
         fill(64,0,0); 
       } else if (cell == 6 ) {
         fill(0,64,64); 
       } else if (cell == 7 ) {
         fill(64,64,64); 
       }
       
       
       //print(cell);
       //fill(cell);
       rect(i * size, j * size, size, size);
     }
  }
  fill(255,0,0);
  rect(x * size, y * size, size, size);
}
char cellToRule(int cell) {
  char r = 'E'; //e for error
  if (cell >= 0 && cell <numRules) {
    r = rules[cell];
  }
  return r;
}
void update () {
  generations++;
  int futureCell;
  cell = grid[x][y];
  futureCell = ( cell + 1 ) % numRules;
  char r = cellToRule(cell);
  
   if (r == 'L') {
      
      dir = (dir - 1 ) % 4;
      if(dir<0) dir += 4;
      
   } else if(r == 'R') {
     
     dir = (dir + 1 ) % 4;
      if(dir<0) dir += 4;
   } else if( r == 'E') {
     float x = random(0,1);
     if(x <0.5) {
       dir = (dir - 1 ) % 4;
      if(dir<0) dir += 4;
     } else {
       dir = (dir + 1 ) % 4;
      if(dir<0) dir += 4;
     }
   }
   cell = futureCell;
   grid[x][y] = futureCell;
}


void move() {
  switch(dir) {
    case 0:
      x += 1;
      x = x % cols;
    
      break;
     
    case 1:
      y += 1;
      y = y % rows;
    
     break;
      
    case 2:
      x -= 1;
      x = x % cols;
      if (x<0) x += cols;
    
      break;
      
    case 3:
      y -= 1;
      y = y % rows;
      if (y<0) y += rows;
    
      break;
      
  }
}

void draw() {
  // draw ant on the board
  numRules = slider2Value;
  for(int i = 0; i < sliderValue; i ++ ) {
        update();
        move();
  }
  // move ant
  //move();
  
  // update board
  drawBoard();
  // draw board
  fill(64);
  textSize(16);
 // text("Generations: "+ generations,16,16);
  
}
