/*
 2019 new years resolutions
 everday tasks
 program
 play music
 brush teeth
 finish
*/


/* djam goals
 
  YEs ! seeral different objects
  Yes ! thought walker leaves objects behind on the screen.
  Yes !array list of screen objects
  
  draw shapes?
  hsb color blobs.
  Yes ! leaves behind ascii text blobs.
  
  Yes! mouse click drops target for random mover to walk to.
  Yes! no mouse click it picks a random target
  
  Time Spent
  40min.
  
  A Series of Daily Projects Linked together by some theme.
  Restart after 4 or so?

*/


ThoughtWalker danny;
int fadeCounter = 0;
int fadeRate = 10;
void setup() {
  size(400,800);
  danny = new ThoughtWalker();
}

void draw() {
  //background(0);
  fadeCounter = (fadeCounter + 1) % 10;
  if(fadeCounter == fadeRate -1) {
    fill(0,0,0,2);
    rect(0,0,width,height);
  }
  fill(255);
  fill(map(mouseY,800,0,180,255));
  text("Journal Entry 003 - January 05(late) 2019 - 8:47 AM",4,16);
  danny.update();
  danny.draw();
  fill(12);
  rect(width/2,555, 64,128);
  
}
void mouseClicked() {
  //danny.setLocation(mouseX, mouseY);
  danny.changeDirection(mouseX, mouseY);
  danny.addThoughtBlob();
}
