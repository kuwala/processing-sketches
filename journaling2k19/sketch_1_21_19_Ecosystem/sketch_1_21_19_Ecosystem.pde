

/* djam goals
  
  Create an over arching project. A simulation - gamie - musical - environment...
  Start to build an environment for my components to live in.
  -- input.
  -- scene.
    --- list of objects to update and draw
  -- midi out
  -- timer
  
  Componentize a cellular automata board.
  create a player object to interact with the board.

  
  In the future I want the components to be able to pass data betwene each
  
  
  The object to test the ecosystems most powerfull features.
  Cellular Automata-EmurationSpawnHouse

*/


ThoughtWalker danny;
ArrayList<Entity> entities;

void setup() {
  size(400,800);
  entities = new ArrayList<Entity>();
  
  danny = new ThoughtWalker();
  entities.add(danny);
  entities.add(new ThoughtWalker());
}

void draw() {
  //background(0);
  fill(0,0,0,4);
  rect(0,0,width, height);
  fill(160);
  text("Journal Entry 002 - January 06 2019 - 12:48 AM",width/2,16);
  fill(200);
  text("move your mouse in a cirlce and press space!", width/2,32);

  for (Entity entity : entities) {
      entity.update();
      entity.draw();
  }
  // Remove finished entities that are no longer "alive"
  for(int i = entities.size() - 1; i >= 0; i--) {
    Entity ent = entities.get(i);
    if(ent.finished()) {
      entities.remove(i);
    }
  }

}
void mouseClicked() {
  danny.setLocation(mouseX, mouseY);
}

void keyPressed() {
  if(key == ' ') {
    ThoughtWalker dude = new ThoughtWalker();
    dude.setLocation(mouseX, mouseY);
    entities.add(dude);
  }
}
