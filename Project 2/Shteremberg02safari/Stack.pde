class stack {

  Stack<Food> st = new Stack<Food>();
  int stackCounter = 0;
  
  void add(Food f) {
    st.push(f);
    stackCounter++;
    f.location.x = 300;
    f.location.y = (stackCounter + (f.diameter*2)) + (height - 200);
  }
  
  void remove(Food f){
    if( f.c == st.peek().c){
      st.pop();
    }
  }

  void draw() {
    for (Food f : st) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
  }
}