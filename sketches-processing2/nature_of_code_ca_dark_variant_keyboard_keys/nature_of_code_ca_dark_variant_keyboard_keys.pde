/*
int[] cells = {1,0,1,0,0,0,0,1,0,1,1,1,0,0,0,1,1,1,0,0];
 int[] newcells = new int[cells.length];
 
 //drawing a generation
 for(int i = 0; i < cells.length; i ++ ) {
 if (cells[i] == 0) fill(255);
 else fill(0);
 stroke(0);
 rect(i*50,0,50,50);
 }
 
 
 // ignore edge cases
 for (int i = 1; i < cell.length - 1; i ++ ) {
 int left;
 int middle;
 int right;
 
 int newstate = rules(left,middle,right);
 
 newcell[i] = newstate;
 
 }
 cells = newcells;
 
 int[] ruleset = { 0,1,0,1,1,0,1,0};
 int rules (int a, int b, int c) {
 if      (a == 1 && b == 1 && c == 1) return ruleset[0];
 else if (a == 1 && b == 1 && c == 0) return ruleset[1];
 else if (a == 1 && b == 0 && c == 1) return ruleset[2];
 else if (a == 1 && b == 0 && c == 0) return ruleset[3];
 else if (a == 0 && b == 1 && c == 1) return ruleset[4];
 else if (a == 0 && b == 1 && c == 0) return ruleset[5];
 else if (a == 0 && b == 0 && c == 1) return ruleset[6];
 else if (a == 0 && b == 0 && c == 0) return ruleset[7];
 // For this function to be valid, we have to make sure something is returned
 // in cases where the states do not match one of the eight possibilities.
 // We know this is impossible given the rest of our code, but Processing does not.
 return 0;
 }
 */
/*
// updating next generation
 // with loop around for edge cases
 for (int i = 0; i < cell.length; i ++ ) {
 int left;
 int middle;
 int right;
 
 if( i == 0 )               left   = cell.length - 1;
 else                       left   = cell[i-1];
 middle = cell[i];
 if ( i == cell.length - 1) right  = cell[0];
 else                       right  = cell[i+1];
 
 int newstate = rules(left,middle,right);
 
 cell[i] = newstate;
 }
 */
CA dude;
PFont f;
int fillColor = 255;
int antiFillColor = 0;
void setup() {
  size(1200, 800);
  frameRate(30); 
  dude = new CA();

  f = createFont("Arial", 16, true);
  //stroke(fillColor);
  noStroke();
}

void draw() {
  //background(255);
  dude.draw();
  textFont(f, 32);
  fill(random(255), random(255), random(255));

  //text("Rule: " + dude.ruleName, width - 180, 40);
  dude.generate();
}
void mousePressed() {
  dude.reboot();
}

class CA {
  int[] cells;
  int[] ruleSet;
  int w = 8;
  int generation = 0;
  int ruleName = 90;

  CA() {

    cells = new int[width/w];
    ruleSet = new int[] {
      0, 1, 0, 1, 1, 0, 1, 0
      } 
      ;
    resetCells();
    //randomizeCells();
  }
  void setRule(byte r) {
    // getting individual bits out of a byte via bitwise and
    // then setting them to the rule set
    
    int a = (r & 0x01) > 0 ? 1: 0; // 1
    int b = (r & 0x02) > 0 ? 1: 0;; // 2
    int c = (r & 0x04) > 0 ? 1: 0;; // 4
    int d = (r & 0x08) > 0 ? 1: 0;; // 8
    int e = (r & 0x10) > 0 ? 1: 0;; // 16
    int f = (r & 0x20) > 0 ? 1: 0;; // 32
    int g = (r & 0x40) > 0 ? 1: 0;; // 64
    int h = (r & 0x80) > 0 ? 1: 0;; // 128
    
    ruleSet = new int[] { 
      a, b, c, d, e, f, g, h
    };
    
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
  void reboot() {
    newRules();
    resetCells();
    generation=0;
    //randomizeCells();
    println("Done");
    background(255);
  }
  void draw() {
    if (generation*w >= height) {
      newRules();
      resetCells();
      generation=0;
      //randomizeCells();
      println("Done");
      background(255);
    }
    for (int i = 0; i < cells.length; i ++ ) {
      if (cells[i] == 1)  fill(fillColor);
      else              fill(antiFillColor);
      rect(i*w, generation*w, w, w);
    }

    // transparent fillter
    color c = color(0, 0, 0, 12);
    fill(c);
    rect(0, 0, width, height);
  }
}

void keyPressed() {
  if (key >-1 && key < 256);
  println(key);
  byte newRule = (byte)key;
  println(newRule);
  dude.setRule(newRule);
}