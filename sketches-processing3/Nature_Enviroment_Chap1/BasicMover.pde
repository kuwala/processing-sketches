class BasicMover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topSpeed = 12;
  float radius = 16;
  float diameter = 32;
  color c;
  
  BasicMover() {
    location = new PVector(width/2, height/2);
    
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    randomizeCol();
  }
  
  void setAcceleration(PVector ac) {
    acceleration = ac;
  }
  
  void setLocation(PVector loc) {
    location = loc; 
  }
  
  void randVelocity() {
    velocity = new PVector(random(-3,3),random(-3,3));
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }
  void draw() {
    noStroke();
    fill(c);
    ellipse(location.x, location.y, diameter, diameter);
    
  }
  void randomizeCol() {
     c =color(random(0,255),random(0,255),random(0,255));
  }
  
  void checkEdges(){
    
    // Collision with Right
    if (location.x + radius > width) {
      location.x = width - radius;
      velocity.x = velocity.x * -1;
    //  acceleration.x = acceleration.x * -1;
      randomizeCol();
    //Collision with Left
    } else if (location.x - radius < 0) {
      location.x = 0 + radius;
      velocity.x = velocity.x * -1;
    //  acceleration.x = acceleration.x * -1;
      randomizeCol();
    }
    
    // Collision with Bottom
    if (location.y + radius > height) {
      location.y = height - radius;
      velocity.y = velocity.y * -1;
     // acceleration.y = acceleration.y * -1;
      randomizeCol();
    // Collision with Top
    } else if (location.y - radius < 0){
      location.y = 0 + radius;
      velocity.y = velocity.y * -1;
    //  acceleration.y = acceleration.y * -1;
      randomizeCol();
    }
  }
  
  void slideEdges() {
    // Collision with Right
    if (location.x + radius > width) {
      location.x -= width ;
      
    //Collision with Left
    } else if (location.x - radius < 0) {
      location.x += width ;
    }
    
    // Collision with Bottom
    if (location.y + radius > height) {
      location.y -= height ;

    // Collision with Top
    } else if (location.y - radius < 0){
      location.y += height ;
    }
  }
  
}