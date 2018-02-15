class CarMover extends BasicMover {
  PVector acc;
  PVector decc;
  PVector zero;
  
  CarMover() {
    acc  = new PVector(0,-0.2);
    decc = new PVector(0, 0.2);
    zero = new PVector(0,0);
  }
  
  void gasPedal() {
    acceleration = acc;
  }
  void releasePedal() {
    acceleration = zero;
  }
  void breakPedal() {
    acceleration = decc;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    //Friction hack
    velocity.mult(0.985);
  }
}