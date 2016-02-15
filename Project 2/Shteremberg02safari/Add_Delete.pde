class addDelete{
  
  final int addSection1 = 300;
  final int deleteSection1 = 600;
  final int addSection2 = 900;
  final int deleteSection2 = 1200;
  
  boolean isAdd(Walker walker){
    if(walker.location.x <= 300 || (walker.location.x <= 900 && walker.location.x >= 600)){
      return true;
    }
    return false;
  }
  
  void draw(){ //<>//
    fill(0,0,0);
    line(addSection1, 0, addSection1, (height - 200)); //<>//
    text("ADD", (addSection1/2), 10);
    line(deleteSection1, 0, deleteSection1, (height - 200));
    text("DELETE", (deleteSection1 - (width/8)), 10);
    line(addSection2, 0, addSection2, (height - 200));
    text("ADD", (addSection2 - (width/8)), 10);
    line(deleteSection2, 0, deleteSection2, (height - 200));
    text("DELETE", (deleteSection2 - (width/8)), 10);
    line(0, height - 200, width, height - 200);
  }
  
  
  
}