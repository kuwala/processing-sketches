/*
 2019 new years resolutions
 everday tasks
 program
 play music
 brush teeth
 finish
*/


/* mini journal


*/

/*= {
  "I should take a shower...",
  "I want to make a present for Amalia.",
  "2019 already...",
  "i guess I am okay",
  "I want to make electronics.",
  "Make a controller!",
  "lets !!!!",
  "can this program do emoji? 🌚"
};
*/

  class ThoughtWalker {
  PVector location;
  PVector destination;
  int stepSize;
  int size;
  String thought;
  StringList thoughts;
  long timer;
  int timeStep;
  ThoughtWalker() {
    location = new PVector( width/2, height/2);
    changeDirection(); // instatiates destination

    stepSize = 100;
    size = 32;
    thought = "hello";
    thoughts = new StringList();
    thoughts.append("I want to make a present for Amalia.");
    thoughts.append("2019 already...");
    thoughts.append("i guess I am okay");
    thoughts.append("oops, I stayed up till 5:21am");
    thoughts.append("these are  my thoughts");
    thoughts.append("zzzz");

    thoughts.append("( . Y . )");

    thoughts.append("I want to make 3D art!");

    thoughts.append("🍊unicode please!");
    
    thoughts.append("I am hungry");
    thoughts.append("aaaaah");
    
    timer = millis();
    timeStep = 1000;
    
    
    
  }
  void changeThought() {
    thought = thoughts.get((int)random(thoughts.size()));
  }
  void changeDirection() {
    float x = location.x;
    float y = location.y;
    destination = new PVector(x + random(-stepSize, stepSize), y + random(-stepSize, stepSize));
  }
  void draw() {
    fill(255);
    rect(location.x, location.y, size, size);
    text(thought,location.x,location.y);
  }
  void setLocation(float x, float y) {
    location = new PVector(x,y);
  }
  void update() {
    PVector distance = new PVector(destination.x  - location.x, destination.y - location.y);
    distance.mult(0.1);
    location.add(distance);
    if(millis() - timer >= timeStep) {
      changeThought();
      changeDirection();
      timer = millis();
    }
    
  }
    
}
ThoughtWalker danny;
void setup() {
  size(400,800);
  danny = new ThoughtWalker();
}

void draw() {
  background(0);
  fill(map(mouseY,800,0,180,255));
  text("Journal Entry 001 - January 02 2019 - 6:06 AM",4,16);
  text("I guess I am okay. the new year has started and I have done a lot so far. \nI wounder if this iwll keep \n \nThese thoughts are kind of fleeting.. and mostly vanished.. lets sleep. \n zzzzzz", 4, 64);
  danny.update();
  danny.draw();
  fill(12);
  rect(width/2,555, 64,128);
  
}
void mouseClicked() {
  danny.setLocation(mouseX, mouseY);
}
