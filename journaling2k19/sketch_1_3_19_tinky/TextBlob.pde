  class TextBlob {
  PVector location;
  int size;
  String text;
  //StringList thoughts;
  long timer;
  int timeStep;
  TextBlob(PVector _location, String _text) {
    location = _location;
    //location = new PVector( width/2, height/2);

    size = 32;
    text = _text;

    timer = millis();

  }
  //void changeThought() {
  //  thought = thoughts.get((int)random(thoughts.size()));
  //}
  //void changeDirection(float _x, float _y) {
  //  destination = new PVector(_x, _y);
  //}
  //void randomDirection() {
  //  float x = location.x;
  //  float y = location.y;
  //  destination = new PVector(x + random(-stepSize, stepSize), y + random(-stepSize, stepSize));

  //}
  void draw() {
    fill(255);
    //rect(location.x, location.y, size, size);
    //textAlign(CENTER);
    text(text,location.x,location.y);
  }
  void setLocation(float x, float y) {
    location = new PVector(x,y);
  }
  void update() {
    //distance.mult(0.1);
    //location.add(distance);
    if(millis() - timer >= timeStep) {
      // do something fun?
      timer = millis();
    }
    
  }
    
}
