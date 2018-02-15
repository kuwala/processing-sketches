class SlyMover extends BasicMover {
  // moves in a random direction
  // ossilates perpendiculary to dir
  
  PVector dir;
  PVector perp;
  
  int lifeLength; // in steps
  int dirLength;
  
  float theta;
  float tStep;
  
  PVector newAcceleration;
  
  SlyMover(float nx, float ny) {
     PVector loc = new PVector(nx, ny);
     setLocation(loc);
     changeDir();
     resetDirLength();
     topSpeed = 3;
     
     tStep = 0.4;
     theta = 0;
     
  }
  void resetDirLength() {
    dirLength = 50 + int(random(0,30));
  }
  void changeDir() {
    // pick a direction
    // calc perpendicular
    // v = ( a, b)
    // v_perp = ( -b, a )
    
    float x = random(-1,1);
    float y = random(-1,1);
    
    dir = new PVector(-1, 1);
    dir.normalize();
    perp = new PVector( dir.y * -1, dir.x );
    perp = new PVector( 1,1);
    //perp.normalize();
    
    //Scale it down a bit
   // dir.mult(0.08);

    
  }
  
  void update() {
    // check if not time to change direction
      // move in direction
      // move perpendicular based on sin(step)
    if (dirLength > 0) {
      PVector newAcceleration = dir;
      //acceleration.mult(0.7);
      float scale = sin(theta) * 10;
      scale = 1;
      //PVector scaledPerp = PVector.mult(perp, scale);
      //scaledPerp = perp;
      newAcceleration.add(perp);
      
      acceleration = newAcceleration;
      velocity.add(acceleration);
      velocity.limit(topSpeed);
      location.add(velocity);
      
      theta += tStep;
      dirLength --;
      
      //reset the new Acceleration
      // so that you dont get addition for each 
      // frame update
      newAcceleration.mult(0);
    } else {
      resetDirLength();
      changeDir();
    }
  }
  
  void draw() {
    //draw circle
    //draw direction
    //draw perp
    
    super.draw();
    
    stroke(0);
    float x = location.x;
    float y = location.y;
    println(" .. " );
    println(perp.x);
    line(x, y, x + (perp.x * radius*2), y + (perp.y * radius*2) );
    
    stroke(255,0,0);
    line(x, y, x + (dir.x * 30), y + (dir.y * 30 ) );
    
  }
}