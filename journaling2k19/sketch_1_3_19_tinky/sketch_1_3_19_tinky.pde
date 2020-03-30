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

void setup() {
  size(400,800);
  danny = new ThoughtWalker();
}

void draw() {
  background(0);
  fill(map(mouseY,800,0,180,255));
  text("Journal Entry 002 - January 03 2019 - 10:47 AM",4,16);
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
