// Langtons Ant

// 2d Grid

// Ant mpves

int rows = 10;
int cols = 10;
float [][] grid = new float[cols][rows];

int size = 30;

int x = 4;
int y = 4;
int dir = 0;


void setup() {
  //noStroke();
  size(300,300);
  for (int i = 0; i < cols; i ++ ) {
     for (int j = 0; j < rows; j++) {
       grid[i][j] = i % 2;
       //grid[i][j] = (((float)(j * cols )+ i ) / 100) * 255;
     }
  }
}
void update () {
  int futureCell;
   if (cell == 0) {
      futureCell = 1;
      dir = (dir + 1 ) % 4;
      if(dir<0) dir += 4;
      
   } else {
     futureCell = 0;
     dir = (dir + 1 ) % 4;
      if(dir<0) dir += 4;
   }
}

void move() {
  switch(dir) {
    case 0:
      x += 1;
      x = x % 10;
    
      break;
     
    case 1:
      y += 1;
      y = y % 10;
    
     break;
      
    case 2:
      x -= 1;
      x = x % 10;
      if (x<0) x += 10;
    
      break;
      
    case 3:
      y -= 1;
      y = y % 10;
      if (y<0) y += 10;
    
      break;
      
  }
}


void draw() {
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
}