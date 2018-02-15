class NoteDrunk {
  int x;
  int y;
  int size;
  int col;
  int note;
  int stepSize;
  float bias;
  NoteDrunk() {
    x = 10;
    y = 10;
    size = 32;
    
    note = 64;
    stepSize = 10;
    bias = 0;
    col = (int)random(127);
  }
  void update() {
    int x = 1;
    randomStep();
  }
  void randomStep() {
    this.x = (int)(random(width) - size);
    this.y = (int)(random(height) - size);
  }
  void moveNote() {
    note = note + (int) ( random( stepSize) - (stepSize / 2) + bias);
  }
  void draw() {
    fill(this.col);
    rect(this.x, this.y, this.size, this.size);
  }
  void setX(int nx) {
    this.x = nx;
  }
  void setSize(int nsize) {
    this.size = nsize;
  }
  int getSize() {
    return size;
  }
  void setColor(int ncol) {
    this.col = ncol;
  }
  int getX() {
    return this.x;
  }
  
}