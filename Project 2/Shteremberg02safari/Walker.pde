class Walker {
  Bag bag = new Bag();

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

  void draw() {
    //stroke(random(255), random(255), random(255));
    ellipse(location.x, location.y, WIDTH, WIDTH);
    for (Food f : bag.data) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
    for (Food f : data) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
  }

  boolean isTouching(Food f) {
    return dist(location.x, location.y, f.location.x, f.location.y) < (WIDTH / 2 + f.diameter / 2);
  }

  void eat(Food f, String s) {
    if (s.equals("bag")) {
      bag.add(f);
      f.location.x = random(0, 200);
      f.location.y = random(height - 200, height);
    }
    if (s.equals("stack")){
      data.add(f);
      f.location.x = 300;
      f.location.y = (data.size() + (f.diameter*2)) + (height - 200);
    }
  }
}