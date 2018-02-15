void setup() {
  frameRate(10);
}

void draw() {
  for(int i = 0; i < 100; i ++) {
    for(int j = 0; j < 100; j ++) {
      rect(20,30,i,j);
    }
  }

}
