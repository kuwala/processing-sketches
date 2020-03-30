float angle = 0;
int hue = 0;
ColoredRow row1 = new ColoredRow(10, 10,100, 800, 0.0);
ArrayList<ColoredRow> rows = new ArrayList<ColoredRow>();
void setup() {
  size(800, 800);
  colorMode(HSB, 255);
  noStroke();
  //frameRate(10);
  for (int i = 0; i < 8; i ++ ) {
    rows.add(new ColoredRow(0,i*100,100,800, (float)i * 0.1));
  }
}



  void draw() {
    // get 4
    // draw squares to fill the screen
    //row1.draw();
    for(ColoredRow row : rows) {
      row.draw();
    }
  }