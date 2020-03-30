  // Langtons Ant

// 2d Grid

// Ant mpves

LangtonsAnt board1;
LangtonsAnt board2;
LangtonsAnt board3;

ArrayList<LangtonsAnt> antBoards = new ArrayList<LangtonsAnt>();

int newBoardSize = 9;

// Objects can be added to an ArrayList with add()
//particles.add(new Particle());
boolean strokes = true;
long lastTime = 0;
long timeLimit = 250;

float range = 0;
void setup() {
  //noStroke();
  //frameRate(30);
  size(1400,800);
  
  //top
  //antBoards.add(new LangtonsAnt(60,0, 5, 60));
  
  ////left
  //antBoards.add(new LangtonsAnt(0,60, 20, 5));
  //antBoards.add(new LangtonsAnt(0,270, 40, 5));
  
  ////bottom
  //antBoards.add(new LangtonsAnt(0,700, 8, 70));
  
  ////right
  //antBoards.add(new LangtonsAnt(770,60, 20, 3));
  //antBoards.add(new LangtonsAnt(770,270, 40, 3));
  int cols = 24;
  int rows = 24;
  int size = 1;
  for  (int i = 0; i < cols; i ++) {
   for (int j = 0; j < rows; j ++) {
     // create board
     //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
     int x = i * 1;
     int y = j * 50;
     antBoards.add(new LangtonsAnt(x,y,size+i,size+j,2));
   }
  }
 

  
 
}
void moveAllBoards() {
  int cols = 24;
  int rows = 24;
  int size = 1;
  for  (int i = 0; i < cols; i ++) {
   for (int j = 0; j < rows; j ++) {
     // create board
     //antBoards.add(new LangtonsAnt(ceil((10+random(600)) / 10) * 10, ceil((10+random(600)) / 10) * 10, newBoardSize, newBoardSize));
     int x = round(i * map(mouseX, 0, width, 1, 16));
     int y = j * 50;
     antBoards.get(i * cols + j).setBoardXY(x,y);
   }
  }
}
void draw() {
  // call object
  background(255);
  fill(0);
  rect(10,10,10,10);
  moveAllBoards();
  for(LangtonsAnt ant : antBoards) {
    
    ant.updateAndDraw();
  }
  //board1.updateAndDraw();
  //board2.updateAndDraw();
  //board3.updateAndDraw();
  noFill();
  stroke(2);
  float xx = range * 100;
  float yy = range * 100;
  rect((mouseX / 10) * 10, (mouseY / 10) * 10, newBoardSize * 10,newBoardSize * 10);
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
  //noStroke();
}

void mouseClicked() {
  
  antBoards.add(new LangtonsAnt((mouseX / 10) * 10, (mouseY / 10) * 10, newBoardSize, newBoardSize, 10));
  newBoardSize = ceil(random(30));
}

void keyPressed() {
  if (key == 'a') {
    strokes = !strokes;
    print("a");
    
  }
  if (key =='1') {
    range += 0.01;
  }
  if(key =='2') {
    range -= 0.01f;
  }
}
