// Langtons Ant

// 2d Grid

// Ant mpves

int rows = 80;
int cols = 80;
int [][] grid = new int[cols][rows];

int size = 10;

int x = cols/2;
int y = rows/2;
int dir = 0; // counter clockwise starting facing right
int cell = 0;
int generations = 0;

// rule definition
int numRules = 8;
char rules[] = {'L','R','R','L','L','R','R','L'};

void setup() {
  noStroke();
  frameRate(300);
  size(800,800);
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
  update();
  // move ant
  move();
  // update board
  drawBoard();
  // draw board
  fill(64);
  textSize(16);
 // text("Generations: "+ generations,16,16);
  
}
