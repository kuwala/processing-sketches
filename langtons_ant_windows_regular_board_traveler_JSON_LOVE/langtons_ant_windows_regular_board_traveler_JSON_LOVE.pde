
// Langtons Ant

//LangtonsAnt board1;
//LangtonsAnt board2;
//LangtonsAnt board3;

ArrayList<LangtonsAnt> antBoards = new ArrayList<LangtonsAnt>();
int newBoardSize = 9;

Table table;

// Objects can be added to an ArrayList with add()
//particles.add(new Particle());
boolean strokes = false;
long lastTime = 0;
long timeLimit = 250;
float boardX = 0;
float boardY = 0;
int generations = 0;
void setup() {
  //noStroke();
  //frameRate(30);
  size(800,800);
 
  table = loadTable("boards.csv", "header"); // open file

  //generateBoardLocations();

  loadBoardLocations();
}
void generateBoardLocations() {
  table.clearRows();
   int cols = 8;
  int rows = 16;
  int size = 1;
  for  (int i = 0; i < cols; i ++) {
   for (int j = 0; j < rows; j ++) {
     // create board
     //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
     int x = i * 100;
     int y = j * 100;
     //antBoards.add(new LangtonsAnt(x,y,size+i,size+j));
     TableRow row = table.addRow();
     row.setInt("x", x);
     row.setInt("y", y);
     row.setInt("width", size+i);
     row.setInt("height", size+j);
   }
  }
  
}
void loadBoardLocations() {
  // load a CSV file into a Table object
  // "header" option indicates the file has a header row
  
  int rowCount = 0;
  for(TableRow row : table.rows()) {
    int x = row.getInt("x");
    int y = row.getInt("y");
    int w = row.getInt("width");
    int h = row.getInt("height");
    
     antBoards.add(new LangtonsAnt(x,y,w,h));
    
    // load a new board into list of boards
  }
}
void saveBoardLocations() {
  
  saveTable(table, "boards.csv");
}
void draw() {
  // call object
  
  background(255);
  translate(boardX,boardY);
  
  for(LangtonsAnt ant : antBoards) {
    ant.updateAndDraw();
  }
  //board1.updateAndDraw();
  //board2.updateAndDraw();
  //board3.updateAndDraw();
  noFill();
  stroke(2);
  rect(round(boardX*-1)+(mouseX / 10) * 10, round(boardY*-1)+(mouseY / 10) * 10, newBoardSize * 5,newBoardSize * 5);
  if(strokes) {
    stroke(2);
  } else {
    noStroke();
  }
  if(millis() - lastTime > timeLimit) {
    //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
    //newBoardSize = ceil(random(20));
    //if(antBoards.size() > 140) {
    //  antBoards.remove(ceil(random(32)));
    //}
    lastTime = millis();
  }
  if(keyPressed) {
    if(key == 'w') {
      boardY += 4;
    }
    if (key == 's') {
      boardY -= 4; 
    }
    if( key =='a' ) {
      boardX += 4;
    }
    if( key =='d') {
      boardX -= 4;
    }
  }
  //noStroke();
  // draw hud
  fill(64);
  textSize(16);
  text("Generations: "+ generations,16,16);
  generations++;
}

void mouseClicked() {
  int x = round(boardX) + (mouseX / 10) * 10;
  int y = round(boardY) + (mouseY / 10) * 10;
  int w = newBoardSize;
  int h = newBoardSize;
  antBoards.add(new LangtonsAnt(x,y,w,h));
  newBoardSize = ceil(random(30));
  
     TableRow row = table.addRow();
     row.setInt("x", x);
     row.setInt("y", y);
     row.setInt("width", w);
     row.setInt("height", h);
} 

void keyPressed() {
  if(key == 'q') {
    strokes = !strokes;
  }
  if(key == 'o') {
    saveBoardLocations();
  }
}
