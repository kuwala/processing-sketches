// Langtons Ant

//LangtonsAnt board1;
//LangtonsAnt board2;
//LangtonsAnt board3;

ArrayList<LangtonsAnt> antBoards = new ArrayList<LangtonsAnt>();
int newBoardSize = 9;

JSONObject json;

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
  json = new JSONObject();

  //generateBoardLocations();

  loadBoardLocations();
}
/*
farmstuff: {..},
boards: { board1: { boardData: [], "w": 12, "h": 16...}, board2: { ... }

*/
void generateBoardLocation(int x, int y, int w, int h) {
  JSONObject board = new JSONObject();
  int cols = w; int rows = h;
  int cells[][] = new int[rows][cols];
  int cellSize = 1;
  int gens = 0;
  board.setInt("x", x);
  board.setInt("y", x);
  board.setInt("w", w);
  board.setInt("h", h);
  board.setInt("cellSize", cellSize);
  board.setInt("gens", gens);
  
  for  (int i = 0; i < cells.length; i ++) {
    JSONArray column = new JSONArray();
    for (int j = 0; j < cells[i].length; j ++) {
     
      //cells[i][j] = 0;
      column.setInt(j, 0);
      
    }
    board.setJSONArray("row"+Integer.toString(i), column);
  } //end for
  

  
  
}
void loadBoardLocations() {


     antBoards.add(new LangtonsAnt(x,y,w,h));

  
}
void saveBoardLocations() {
  
  saveJSONObject(board,"data/board.json");
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
  rect((mouseX / 10) * 10, (mouseY / 10) * 10, newBoardSize * 5,newBoardSize * 5);
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
  int x = (mouseX / 10) * 10;
  int y = (mouseY / 10) * 10;
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
