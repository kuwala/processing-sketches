/* * * * * * GLOBALS * * * * */

float width = 600;
float height = 600;

/* * * * * * * * * * * * * * */


class SnakeMover extends BasicMover {
  SnakeMover() {
    
  }
  
}


/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * Setup & Draw  * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */







ArrayList<BasicMover> flys = new ArrayList<BasicMover>();

int flyStartCount = 8;

void setup() {
  size(600,600);
  background(240);
  
  

  for (int i = 0; i < flyStartCount; i++) {
    addNewFly();
  }
  
  
}

void addNewFly() {
  float step = 30;
  float nx = random(width/2 - step, width/2 + step);
  float ny = random(height/2 - step, height/2 + step);
  flys.add(new MouseMover(nx, ny) ); 
}

void addNewFlyAt() {
  float nx = mouseX;
  float ny = mouseY;
  flys.add(new MouseMover(nx, ny) ); 
}

void keyPressed() {
  if (keyCode == UP) {
    //vroom.gasPedal();
  } else if (keyCode == DOWN) {
    //vroom.breakPedal();
  }
  
  if (keyCode == BACKSPACE) {
    if (flys.size() > 0) {
      flys.remove(0);
    }
  }
  
  if (keyCode == ENTER) {
    int currentFly= flys.size();
    flys.add(new BasicMover()); 
    flys.get(currentFly).randVelocity();
    
  }
}
void keyReleased() {
  //vroom.releasePedal();
}







void mousePressed() {
 addNewFlyAt();
}

void draw() {
  background(100);
  
  text("Click the Mouse OR Press BackSpace",10,10);
  //fly.checkEdges();
  int flyCount = flys.size();
  for (int i = 0; i < flyCount; i ++ ) {
    flys.get(i).update();
    flys.get(i).draw(); 
  }

  
} 