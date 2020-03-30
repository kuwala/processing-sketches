  class ThoughtWalker {
  PVector location;
  PVector destination;
  int stepSize;
  int size;
  String thought;
  StringList thoughts;
  long timer;
  int timeStep;
  ArrayList<TextBlob> blobs;
  ThoughtWalker() {
    blobs = new ArrayList<TextBlob>();
    location = new PVector( width/2, height/2);
    randomDirection(); // instatiates destination
    

    stepSize = 50;
    size = 32;
    thought = "hello";
    
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
    timeStep = 2000;
    
    
    
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
    fill(255);
    rect(location.x, location.y, size, size);
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
  void update() {
    PVector distance = new PVector(destination.x  - location.x, destination.y - location.y);
    distance.mult(0.1);
    location.add(distance);
    if(millis() - timer >= timeStep) {
      changeThought();
      randomDirection();
      addThoughtBlob();
      timer = millis();
    }
    
  }
    
}
