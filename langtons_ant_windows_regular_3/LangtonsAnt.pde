class LangtonsAnt {
  int rows = 80;
  int cols = 80;
  int [][] grid;
  
  int size;
  
  int boardX;
  int boardY;
  int antX;
  int antY;
  int dir;
  int cell;
  int generations;
  LangtonsAnt(int bx, int by, int nRows, int nCols, int nSize) {
    rows = nRows;
    cols = nCols;
    boardX = bx;
    boardY = by;
    grid = new int[cols][rows];
  
    size = nSize;
  
    antX = cols/2;
    antY = rows/2;
    dir = 0;
    cell = 0;
    generations = 0;
    init();
    
  }
  void init() {
     for (int i = 0; i < cols; i ++ ) {
     for (int j = 0; j < rows; j++) {
       //grid[i][j] = i % 2;
       //grid[i][j] = (((float)(j * cols )+ i ) / 100) * 255;
       grid[i][j] = 0;
     }
  }
  }
  void drawBoard() {
    pushMatrix();
    translate(boardX, boardY);
    
    
    for (int i = 0; i < cols; i ++ ) {
       for (int j = 0; j < rows; j++) {
         int cell = grid[i][j];
         if ( cell  == 1 ) {
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
    noStroke();
    rect(antX * size, antY * size, size, size);
    popMatrix();
  }
  void update () {
  generations++;
  int futureCell;
  cell = grid[antX][antY];
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
   grid[antX][antY] = futureCell;
}


void move() {
  switch(dir) {
    case 0:
      antX += 1;
      antX = antX % cols;
    
      break;
     
    case 1:
      antY += 1;
      antY = antY % rows;
    
     break;
      
    case 2:
      antX -= 1;
      antX = antX % cols;
      if (antX<0) antX += cols;
    
      break;
      
    case 3:
      antY -= 1;
      antY = antY % rows;
      if (antY<0) antY += rows;
    
      break;
      
  }
}

void updateAndDraw() {
  // draw ant on the board
  update();
  // move ant
  move();
  // update board
  drawBoard();
  // draw board
  fill(64);
  //textSize(16);
  //text("Generations: "+ generations,16,16);
  
}
}