import themidibus.*;

PImage img;       // The source image
int cellsize = 5; // Dimensions of each cell in the grid
int newCellSize = 5;
int cols, rows;   // Number of columns and rows in our system
float angle = 0;
float angleStep = 0.1;
int jiggleKnobValue = 0;
int zoomKnobValue = 0;
float jiggleMin = 0;
float jiggleMax = 10;
float jiggle = 0;

float noizeKnobValue = 0;
float noize = 0;
int altNoize = 0;
MidiBus bus;

void setup() {
  size(800, 800, P3D); 
  img  = loadImage("Untitled.png"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
  MidiBus.list();
  
  bus = new MidiBus(this, 0, 2);
}
void controllerChange(int channel, int number, int value) {
  print(value); 
    switch(number) {
    case 16:
      newCellSize = (int)map(value, 0, 127, 1, 40);
      break;
    case 17:
    //jiggleKnib = (int)map(value, 0, 127, jiggleMin, jiggleMax) * sin(angle);
    jiggleKnobValue = value;
    angleStep = map(value, 0, 127, 0, 0.5);
     
      break;
    case 18:
    //angleStep = map(value, 0, 127, 0, 0.5);
    noize = map(value, 0, 127, 0, 10);
    noizeKnobValue = value;
    
      break;
    case 19:
      zoomKnobValue = (int)map(value, 0, 127, 0, width);
    
      break;
    case 34:
      if (value == 127) {
       altNoize = 1;
      } else {
        altNoize = 0;
      }
       break;
  }
   println("Controller change: ");
  println("-------------------");
  println("Chan: "+channel);
  println("Number: "+number);
  println("value: "+value);
}

void draw() {
  angle += angleStep;
  jiggle = (int)map(jiggleKnobValue, 0, 127, jiggleMin, jiggleMax) * sin(angle);
  cellsize = newCellSize;
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = ((zoomKnobValue)/(float)width)*5 * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      //float jiggle = map(mouseY, 0, 100, 0, 10) * sin(angle);;
  
      int bright = (int)brightness(img.pixels[loc]);
      
      if(altNoize == 1) {
        translate((x+jiggle), y* random(noize),z);
      } else {
        float phaseShift = map(noizeKnobValue, 0, 127, 0, 10);
        translate((x+jiggle), y+ sin(angle ) *10,z);

      }
      fill(c);
      noStroke();
      rectMode(CENTER);
      //fill(random(255));
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
  }
}