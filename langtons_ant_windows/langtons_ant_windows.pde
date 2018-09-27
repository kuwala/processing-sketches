// Langtons Ant

// 2d Grid

// Ant mpves

LangtonsAnt board1;
LangtonsAnt board2;
LangtonsAnt board3;

ArrayList<LangtonsAnt> antBoards = new ArrayList<LangtonsAnt>();



// Objects can be added to an ArrayList with add()
//particles.add(new Particle());
boolean strokes = true;
void setup() {
  //noStroke();
  //frameRate(30);
  size(800,800);
  
  //top
  antBoards.add(new LangtonsAnt(60,0, 5, 60));
  
  //left
  antBoards.add(new LangtonsAnt(0,60, 20, 5));
  antBoards.add(new LangtonsAnt(0,270, 40, 5));
  
  //bottom
  antBoards.add(new LangtonsAnt(0,700, 8, 70));
  
  //right
  antBoards.add(new LangtonsAnt(770,60, 20, 3));
  antBoards.add(new LangtonsAnt(770,270, 40, 3));
 

  
 
}
void draw() {
  // call object
  background(200);
  fill(0);
  rect(10,10,10,10);
  for(LangtonsAnt ant : antBoards) {
    ant.updateAndDraw();
  }
  //board1.updateAndDraw();
  //board2.updateAndDraw();
  //board3.updateAndDraw();
  noFill();
  stroke(2);
  rect(mouseX, mouseY, 90,90);
  if(strokes) {
    stroke(2);
  } else {
    noStroke();
  }
  //noStroke();
}

void mouseClicked() {
  antBoards.add(new LangtonsAnt(mouseX, mouseY, 9,9));
}

void keyPressed() {
  if (key == 'a') {
    strokes = !strokes;
    print("a");
    
  }
}