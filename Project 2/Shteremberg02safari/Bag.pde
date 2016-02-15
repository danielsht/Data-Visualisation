class Bag{
  
  ArrayList<Food> data = new ArrayList<Food>();
  
  void add(Food f){
    data.add(f);
    f.location.x = random(0, 300);
    f.location.y = random(height - 200, height);
  }
  
  void remove(Food f){
    for(Food foo : data){
      if(foo.c == f.c){
        data.remove(foo);
        break;
      }
    }
  }
  
  void draw(){
    for (Food f : data) {
      fill(f.c);
      ellipse(f.location.x, f.location.y, 10, 10);
    }
    fill(0,0,0);
    text("Bag", 150, height - 180);
  }
  
}