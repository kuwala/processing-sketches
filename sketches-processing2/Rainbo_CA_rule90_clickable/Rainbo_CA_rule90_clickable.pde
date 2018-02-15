color[] rainbow;
int[] blocks;

CA dude;
PFont f;
int fillColor = 0;
int numBlocks = 40;
int blockWidth = 40;
int [][]blocks2d;

int showCA = 0;

void setup() {
  size(1600, 800);
  frameRate(12); 
  dude = new CA();

  f = createFont("Arial", 74, true);
  stroke(fillColor);
  noStroke();
  
  rainbow = new color[] { color(255,0,0), color(255,127,0), color(255,255,0), color(127,255,0), color(0,255,0), color(0,255,127), color(0,255,255), color(0,127,255), color(0,0,255), color(127,0,255), color(255,0,255),color(255,0,127)};
  
  blocks = new int [numBlocks];
  for (int i = 0; i < blocks.length; i++) {
    if ( 1 == i %2) {
     blocks[i] = 0;
    } else {
      blocks[i] = 0;
    }
    
  }
}
void updateBlocks() {
  for(int i = 0; i < blocks.length; i ++ ) {
    if (dude.cells[i] == 1) {
      blocks[i] += 1;
      if (blocks[i] == rainbow.length) {blocks[i] = 0;}
    }
    
  }
}
void drawBlocks() {
  for(int i = 0; i < blocks.length; i ++ ) {
    fill(rainbow[blocks[i]]);
    rect(i*blockWidth, 0, blockWidth, height);
    
  }
}

void draw() {
  //background(255);
  textFont(f, 74);
  updateBlocks();
  drawBlocks();
  
  if(showCA == 1) {
    dude.drawStrip();
    fill(0);
    text( dude.generation, width - 240, height-60);
  }
  
  
  
  dude.generate();
}

void mouseClicked() {
  if(showCA == 0) showCA =1;
  else showCA = 0;
}
  

class CA {
  int[] cells;
  int[] ruleSet;
  int w = 40;
  int generation = 0;
  int ruleName = 90;

  CA() {

    cells = new int[width/w];
    ruleSet = new int[] {
      0, 1, 0, 1, 1, 0, 1, 0
    } ;
    
    resetCells();
    //randomizeCells();
  }
  void resetCells() {
    generation = 0;
    for (int i = 0; i < cells.length; i ++ ) {
      cells[i] = 0;
    }
    cells[cells.length/2] = 1;
  }
  void randomizeCells() {
    for (int i = 0; i < cells.length; i ++ ) {
      cells[i]=round(random(1));
    }
  }

  void newRules() {
    String s = "";
    for (int i = 0; i < ruleSet.length; i++) {
      ruleSet[i] = round(random(1));
      s += ruleSet[i];
    }
    ruleName = Integer.parseInt(s, 2);
  }

  void generate() {
    int[] nextGen = new int[cells.length];
    //for i = 0
    int left     = cells[cells.length-1];
    int me       = cells[0];
    int right    = cells[1];
    nextGen[0] = rules(left, me, right);
    // for i = length-1
    left         = cells[cells.length-2];
    me           = cells[cells.length-1];
    right        = cells[0];
    nextGen[cells.length-1] = rules(left, me, right);

    for (int i = 1; i < cells.length-1; i++) {
      left   = cells[i-1];
      me     = cells[i];
      right  = cells[i+1];
      nextGen[i] = rules(left, me, right);
    }
    cells = nextGen;
    generation++;
  }

  int rules(int a, int b, int c) {
    // writes the bits [a] [b] [c]
    String s = "" + a + b + c;
    // parses the s as Base 2 number
    int index = Integer.parseInt(s, 2);
    return ruleSet[index];
  }
  void drawStrip() {
    
    
    for (int i = 0; i < cells.length; i ++ ) {
      if (cells[i] == 1)  {
        fill(fillColor);
 
        rect(i*w, height-(w), w, w);
      }
    }
    
  }
  void draw() {
    if (generation*w >= height) {
      //newRules();
      resetCells();
      generation=0;
      //randomizeCells();
      println("Done");
      //background(255);
    }
    for (int i = 0; i < cells.length; i ++ ) {
      if (cells[i] == 1)  fill(fillColor);
      else              fill(255);
      rect(i*w, generation*w, w, w);
    }
  }
}
