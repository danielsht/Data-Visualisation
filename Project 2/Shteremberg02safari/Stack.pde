class stack {

  Stack<Food> st = new Stack<Food>();

  void add(Food f) {
    st.push(f);
    f.location.x = 450;
    if (st.size() <= 1) {
      f.location.y = height - 200;
    } else {
      f.location.y = (st.get(st.size()-2).location.y + 10);
    }
  }

  void remove(Food f) {
    if (!st.empty()) {
      if ( f.c == st.peek().c) {
        st.pop();
      }
    }
  }

  void draw() {
    for (Food f : st) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
    fill(0,0,0);
    text("Stack", 400, height - 180);
  }
}