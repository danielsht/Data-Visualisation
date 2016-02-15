class LList { //<>//

  LinkedList<Food> lList = new LinkedList<Food>();

  void add(Food f) {
    lList.add(f);
    if (lList.size() <= 1) {
      f.location.x = 600;
    } else {
      f.location.x = (lList.get(lList.size()-2).location.x + 10);
    }
    f.location.y = height-100;
  }

  void remove(Food f) {
    Iterator<Food> iter = lList.iterator();

    while (iter.hasNext()) {
      Food foo = iter.next();

      if (foo.c == f.c){
        iter.remove();
        break;
      }
    } //<>//
  }

  void draw() {
    for (Food f : lList) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
      stroke(0, 0, 0);
      line(f.location.x, f.location.y, (f.location.x + 10), f.location.y);
    }
    fill(0,0,0);
    text("Linked List", 750, height - 180);
  }
}