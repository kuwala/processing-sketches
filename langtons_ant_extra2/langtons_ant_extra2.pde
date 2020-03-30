// Langtons Ant

// 2d Grid

// Ant mpves

int rows = 400;
int cols = 800;
float [][] grid = new float[cols][rows];

int size = 2;

int x = cols/2;
int y = rows/2;
int dir = 0;
float cell = 0;
int generations = 0;

void setup() {
  noStroke();
  //frameRate(10);
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
       float cell = grid[i][j];
       if ( cell == 1 ) {
         fill(0);
       } else if ( cell == 0 ) {
         fill(255); 
       } else if (cell == 2 ) {
         fill(127); 
       }
       //print(cell);
       //fill(cell);
       rect(i * size, j * size, size, size);
     }
  }
  fill(255,0,0);
  rect(x * size, y * size, size, size);
}
void update () {
  generations++;
  int futureCell;
  cell = grid[x][y];
   if (cell == 0) {
      futureCell = 1;
      dir = (dir - 1 ) % 4;
      if(dir<0) dir += 4;
      
   } else {
     futureCell = 0;
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
  text("Generations: "+ generations,16,16);
  
}