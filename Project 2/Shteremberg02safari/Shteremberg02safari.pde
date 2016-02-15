import java.util.*; //<>//

Walker walker;
Walker stack;
addDelete AD;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 10;
color[] colors = new color[NUMBER_OF_COLORS];

void setup() {
  size(1200, 700);
  walker = new Walker(new PVector(10, height / 2));
  stack = new Walker(new PVector(0, 0));
  AD = new addDelete();
  for (int i = 0; i < NUMBER_OF_COLORS; ++i) {
    colors[i] = color(random(0, 200));
  }
  for (int i = 0; i < NUMBER_OF_FOODS; ++i) {
    PVector l = new PVector(random(0, width), random(0, height - 200));
    color c = colors[(int)random(0, NUMBER_OF_COLORS)];
    foods.add( new Food(l, c) );
  }
}

void draw() {
  background(55);
  walker.walk();
  stack.walk();
  walker.draw("Bag");
  stack.draw("Stack");
  for (int i = foods.size() - 1; i >= 0; --i) {
    Food f = foods.get(i);
    f.draw();
    if (walker.isTouching(f)) {
      if (AD.isAdd(walker)) {
        walker.eat(f, "bag");
      } else {
        walker.remove(f, "bag");
      }
      foods.remove(f);
    }
    if (stack.isTouching(f)) {
      if (AD.isAdd(stack)) {
        stack.eat(f, "stack");
      } else {
        stack.remove(f,"stack");
      }
      foods.remove(f);
    }
  }
  AD.draw();
}