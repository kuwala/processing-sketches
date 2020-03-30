  class ThoughtWalker implements Entity {
  PVector location;
  PVector destination;
  int stepSize;
  int size;
  String thought;
  StringList thoughts;
  long timer;
  int timeStep;
  int timeAlive;
  long aliveTimer;
  boolean alive;
  color col;
  ArrayList<TextBlob> blobs;
  ThoughtWalker() {
    alive = true;
    col = color(random(255));
    blobs = new ArrayList<TextBlob>();
    location = new PVector( width/2, height/2);
    randomDirection(); // instatiates destination
    

    stepSize = 50;
    size = 32;
    thought = "<3 hello <3";
    
    blobs.add(new TextBlob(location, thought));

    thoughts = new StringList();
    thoughts.append("I want to make a present for Amalia.");
    thoughts.append("2019 already...");
    thoughts.append("i guess I am okay");
    thoughts.append("oops, I stayed up till 5:21am");
    thoughts.append("these are  my thoughts");
    thoughts.append("zzzz");

    thoughts.append("( . Y . )");

    thoughts.append("I want to make 3D art!");

    thoughts.append("🍊unicode please!");
    
    thoughts.append("I am hungry");
    thoughts.append("aaaaah");
    
    timer = millis();
    aliveTimer = millis();
    timeStep = 2000;
    timeAlive = 10000 + (int)random(2000);
    
    
    
  }
  void changeThought() {
    thought = thoughts.get((int)random(thoughts.size()));
  }
  void changeDirection(float _x, float _y) {
    destination = new PVector(_x, _y);
  }
  void randomDirection() {
    float x = location.x;
    float y = location.y;
    destination = new PVector(x + random(-stepSize, stepSize), y + random(-stepSize, stepSize));

  }
  void draw() {
    fill(col);
    //rect(location.x, location.y, size, size);
    ellipse(location.x, location.y, size, size);
    //text(thought,location.x,location.y);
    for(int i = blobs.size()-1; i >= 0; i--) {
      TextBlob _blob = blobs.get(i);
      _blob.update();
      _blob.draw();
      
    }
  }
  void setLocation(float x, float y) {
    location = new PVector(x,y);
  }
  void addThoughtBlob() {
    blobs.add(new TextBlob(new PVector(location.x,location.y), thought));
  }
  boolean finished() {
    return !alive;
  }
  void update() {
    PVector distance = new PVector(destination.x  - location.x, destination.y - location.y);
    distance.mult(0.1);
    location.add(distance);
    if(millis() - timer >= timeStep) {
      //changeThought();
      randomDirection();
      //addThoughtBlob();
      timer = millis();
    }
    if(millis() - aliveTimer >= timeAlive) {
      alive = false;
    }
  }
    
}
