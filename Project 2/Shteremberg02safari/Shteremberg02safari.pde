import java.util.*; //<>//

Walker walker;
Walker stack;
Walker llist;
Walker Hash;
addDelete AD;

ArrayList<Food> foods = new ArrayList<Food>();
final int NUMBER_OF_FOODS = 100;
final int NUMBER_OF_COLORS = 10;
color[] colors = new color[NUMBER_OF_COLORS];

void setup() {
  size(1200, 700);
  walker = new Walker(new PVector(0, height / 2));
  stack = new Walker(new PVector(0, 0));
  llist = new Walker(new PVector(0, height / 4));
  Hash = new Walker(new PVector(0, height - 300));
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
  llist.walk();
  Hash.walk();
  walker.draw("Bag");
  stack.draw("Stack");
  llist.draw("linked list");
  Hash.draw("hash set");
  walker.bag.draw();
  stack.stack.draw();
  llist.llist.draw();
  Hash.hash.draw();
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
    if (llist.isTouching(f)) {
      if (AD.isAdd(llist)) {
        llist.eat(f, "linked list");
      } else {
        llist.remove(f,"linked list");
      }
      foods.remove(f);
    }
    if (Hash.isTouching(f)) {
      if (AD.isAdd(Hash)) {
        Hash.eat(f, "hash set");
      } else {
        Hash.remove(f,"hash set");
      }
      foods.remove(f);
    }
  }
  AD.draw();
}