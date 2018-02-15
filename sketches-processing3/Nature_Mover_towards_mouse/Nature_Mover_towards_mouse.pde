/* * * * * * GLOBALS * * * * */

float width = 600;
float height = 600;

/* * * * * * * * * * * * * * */


class SnakeMover extends BasicMover {
  SnakeMover() {
    
  }
  
}
class MouseMover extends BasicMover {
  // accelerates towards mouse
  // PVector[] = dotsArray; // not used
  
  MouseMover() {
    
  }
  void update() {
    //calculate new acceleration from location
    // dx = mousex - mover.x;
    // dy = mousey - mover.y;
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector newAcceleration = PVector.sub(mouse,location);
    newAcceleration.limit(0.3);
    
    velocity.add(newAcceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    //dampen velocity
    velocity.mult(0.999);
  }
  
  
}


class CarMover extends BasicMover {
  PVector acc;
  PVector decc;
  PVector zero;
  
  CarMover() {
    acc  = new PVector(0,-0.2);
    decc = new PVector(0, 0.2);
    zero = new PVector(0,0);
  }
  
  void gasPedal() {
    acceleration = acc;
  }
  void releasePedal() {
    acceleration = zero;
  }
  void breakPedal() {
    acceleration = decc;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    //Friction hack
    velocity.mult(0.985);
  }
}




/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
/* * * * * * * * * * Setup & Draw  * * * * * * * * * * * */
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * */

int count = 10;
BasicMover[]  moversB;

CarMover vroom = new CarMover();

MouseMover fly = new MouseMover();

void keyPressed() {
  if (keyCode == UP) {
    vroom.gasPedal();
  } else if (keyCode == DOWN) {
    vroom.breakPedal();
  }
}
void keyReleased() {
  vroom.releasePedal();
}

void setup() {
  size(600,600);
  background(240);

  moversB = new BasicMover[count];

  for (int x = 0; x < count; x++) {
      moversB[x] = new BasicMover();
      moversB[x].randVelocity();

  }
  
}

void draw() {
  background(100);
  /*
  for (int i = 0; i < count; i ++ ) {
    moversB[i].update();
    moversB[i].checkEdges();
    moversB[i].draw();
  }
  */
  
  text(mouseY, 20,20);
  //fly.checkEdges();
  fly.update();
  fly.draw();
  
  vroom.checkEdges();
  vroom.update();
  vroom.draw();

  
} 