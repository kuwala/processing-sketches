/*
  Daniesl copy of Arry Objects
*/

int unit = 30;
int count;
Module[] mods;

void setup() {
  size(640, 360);
  noStroke();
  int wideCount = width / unit;
  //int heighCount = height / unit;
  int heightCount = 640;
  count = wideCount * heightCount;
  mods = new Module[count];
  
  int index = 0;
  for (int y = 0; y < heightCount; y ++ ) {
    for(int x = 0; x < wideCount ; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.8, 2.2), unit);
    
    }
  }
}
void draw() {
  background(0);
  for (Module mod : mods) {
    mod.update();
    mod.display();
  }
  
}