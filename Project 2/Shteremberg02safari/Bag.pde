class Bag{
  
  ArrayList<Food> data = new ArrayList<Food>();
  
  void add(Food f){
    data.add(f);
  }
  
  int size(){
    return data.size();
  }
  
}