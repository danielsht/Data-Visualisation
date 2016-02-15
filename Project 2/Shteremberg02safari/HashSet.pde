class hashSet {
  HashSet<Food> hashset = new HashSet<Food>();

  void add(Food f) {
    hashset.add(f);
    if (!hashset.isEmpty()) {
      f.location.x = random(900, 1200);
      f.location.y = random(height - 200, height);
    }
  }

  void remove(Food f) {
    Iterator<Food> iter = hashset.iterator();

    while (iter.hasNext()) {
      Food foo = iter.next();

      if (foo.c == f.c){
        iter.remove();
        break;
      }
    }
  }

  void draw() {
    for (Food f : hashset) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
  }
}