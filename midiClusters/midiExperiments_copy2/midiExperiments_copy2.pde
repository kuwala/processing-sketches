import themidibus.*;

MidiBus myBus;
int pitch = 64;
int noteLength = 200;
int delayBetweenNotes = 100;

void setup() {
  
  MidiBus.list();
  
  myBus = new MidiBus(this, -1, 2);
  
}

void draw() {
  fill(random(255));
 rect(random(100),random(100),10,10); 
 
  int channel = 0;
  pitch = pitch + int(random(10) - 5);
  int velocity = 127;
  
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