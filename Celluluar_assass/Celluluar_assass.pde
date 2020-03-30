ArrayList<LangtonsAnt> ants = new ArrayList<LangtonsAnt>();


void setup() {
  frameRate(1);
  print(32*8);
  size(256,256);
  LangtonsAnt ant = new LangtonsAnt(0,0, 8,8);
  //ant.load();
  ants.add(ant);
}

void draw() {
  for (LangtonsAnt ant : ants) {
    ant.updateAndDraw();
  }
}
