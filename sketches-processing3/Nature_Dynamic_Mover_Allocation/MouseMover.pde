class MouseMover extends BasicMover {
  // accelerates towards mouse
  // PVector[] = dotsArray; // not used
  
  MouseMover(float nx, float ny) {
    PVector loc = new PVector(nx,ny);
    setLocation(loc);
  }
  void update() {
    //calculate new acceleration from location
    // dx = mousex - mover.x;
    // dy = mousey - mover.y;
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector newAcceleration = PVector.sub(mouse,location);
    newAcceleration.limit(0.3);
    
    velocity.add(newAcceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    //dampen velocity
    velocity.mult(0.999);
  }

}