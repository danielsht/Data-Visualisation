class Walker {
  Bag bag = new Bag();
  stack stack = new stack();

  final int MAX_VELOCITY = 1;
  final float NOISE_DELTA = random(0.1);
  final int WIDTH = 50;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector tendency;
  float xOffset;
  
  ArrayList<Food> data = new ArrayList<Food>();

  public Walker(PVector initialLocation) {
    this.location = initialLocation;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    tendency = new PVector(1.4, 0);
    xOffset = 0.0;
    textAlign(CENTER, CENTER);
  }

  public void walk() {
    acceleration = PVector.fromAngle( noise(xOffset) * TWO_PI  );
    velocity.add(acceleration);
    velocity.add(tendency);
    location.add(velocity);
    velocity.limit(MAX_VELOCITY);
    xOffset += NOISE_DELTA;
    if (location.y < 0) location.y = height-200;
    if (location.y > height-200) location.y = 0;
    if (location.x < 0) location.x = width;
    if (location.x > width) location.x = 0;
  }

  void draw(String dataStructType) {
    fill(255, 255, 255);
    ellipse(location.x, location.y, WIDTH, WIDTH);
    fill(0, 0, 0);
    text(dataStructType, location.x, location.y);
    bag.draw();
    stack.draw();
  }

  boolean isTouching(Food f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (WIDTH / 2 + f.diameter / 2);
  }

  void eat(Food f, String s) {
    if (s.equals("bag")) {
      bag.add(f);
    }
    if (s.equals("stack")){
      stack.add(f);
    }
  }
  
  void remove(Food f, String s){
    if (s.equals("bag")) {
      bag.remove(f);
    }
    if (s.equals("stack")){
      stack.remove(f);
    }
  }
}