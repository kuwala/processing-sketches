import themidibus.*;
/*

Listens for midi for a controller and outputs midi streams while drawing rectangles

*/

MidiBus myBus;
int pitch = 64;
int noteLength = 100;
int delayBetweenNotes = 50;
int size = 80;

NoteDrunk drunk;

void setup() {
  size(1200, 800);
  
  MidiBus.list();
  
  myBus = new MidiBus(this, 0, 2);
  drunk = new NoteDrunk();
  background(0);
  noStroke();
  
}

void dimDisplay() {
  //background(0,0,0,200);
  fill(0,0,0,10);
  rect(0,0,width,height);
}

void draw() {
  //dimDisplay();

  
  int darkness = int(random(255));
  fill(darkness);
  
  //rect(random(202),random(202),10,10); 
  drunk.setColor(darkness);
  drunk.update();
  drunk.draw();
  
  
  int channel = 0;
  pitch = pitch + int(random(10) - 5);
  //int velocity = int(darkness/2);
  int velocity = drunk.getSize();
  
  myBus.sendNoteOn(channel, pitch, velocity);
  delay(noteLength);
  myBus.sendNoteOff(channel, pitch, velocity);
  
  int number = 0;
  int value = 90;
  
  myBus.sendControllerChange(channel, number, value);
  delay(delayBetweenNotes);
}

void noteOn(int channel, int pitch, int velocity) {
  print("Note On -- ");
  println("Pitch: "+pitch);
  
}
void controllerChange(int  channel, int number, int value) {
  println("Controller change: ");
  println("-------------------");
  println("Chan: "+channel);
  println("Number: "+number);
  println("value: "+value);
  
  switch(number) {
    case 1:
      noteLength = (int)map(value, 0, 127, 5, 500);
      delayBetweenNotes = noteLength/2;
      break;
    case 2:
      int size = (int)map(value, 0, 127, 1, 500);
      drunk.setSize(size);
    
      break;
    case 16:
    noteLength = (int)map(value, 0, 127, 5, 500);
      delayBetweenNotes = noteLength/2;
    
      break;
    case 17:
     size = (int)map(value, 0, 127, 1, 500);
      drunk.setSize(size);
    
      break;
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}