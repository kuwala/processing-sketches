int rows = 201;
int cols = 401;
int center = 200;
int[][] grid;
int cellSize = 2;
int cellColor;
boolean[] passedStrip;
boolean[] currentStrip;
int gridX = 20;
int gridY = 20;
// generation counter
int generation = 0;
int generationsMax = 200;

void setup() {
  size(840, 440);
  background(32);
  noStroke();
  //noLoop();
  frameRate(16);
 
  currentStrip = new boolean[cols];
  passedStrip = new boolean[cols];
  for(int i = 0; i < cols; i ++ ) {
    currentStrip[i] = false;
    passedStrip[i] = false;
  }
  //set initial piece to true
  currentStrip[center] = true;
  drawRow(generation);
  print("Settup finish!");
}
boolean checkRules(boolean a, boolean b, boolean c) {
  // a = left neighbor
  // b = center cell
  // c = right neighbor
  // r = result
  // [ a ] [ b ] [ c ]
  //       [ r ]
  
  // B 1 2 3 4 5 6 7 8 
  // bits in byte order
  int result = 0;
                         // rule 30
  if ( a & b & c )       result = 0;
  if ( a & b & !c )      result = 0;
  if ( a & !b & c )      result = 0;
  if ( a & !b & !c )     result = 1;
  if ( !a & b & c )      result = 1;
  if ( !a & b & !c )     result = 1;
  if ( !a & !b & c )     result = 1;
  if ( !a & !b & !c )    result = 0;
  
  
  if(result == 1) return true;
  else return false;
}
void drawRow(int row) {
  
  for(int i = 0; i < cols; i++) {
    if(currentStrip[i] == true) {
      fill(255);
      rect(gridX + i*cellSize, gridY + row*cellSize, cellSize,cellSize); 
    } else {
      fill(0);
      rect(gridX + i*cellSize, gridY + row*cellSize, cellSize,cellSize); 
    }
  }
}
void genNewCurrentStrip() {
  for(int i = 1; i < cols - 1; i ++) {
    if(checkRules( passedStrip[i-1],passedStrip[i],passedStrip[i+1] ) ) {
      currentStrip[i] = true;
    } else {
      currentStrip[i] = false;
    }
  } 
} //
void draw() {

  
  
  if (generation < generationsMax) {
  
    
    arrayCopy(currentStrip, passedStrip);
    genNewCurrentStrip();
    drawRow(generation+1);
  }
  generation ++;
  
  
  /*
  int generations = 400; // passed 0
  for( int i = 0; i < generations; i ++) {
    drawRow(i);
    arrayCopy(currentStrip, passedStrip);
    genNewCurrentStrip();
    drawRow(i+1);
  }
  */
}
