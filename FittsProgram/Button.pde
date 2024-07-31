class Target{
  float x, y;
  boolean isActiveTarget;
  
  Target(float x,float y){
   this.x = x;
   this.y = y;
   isActiveTarget = false;
  }
  
  void display(){
    if (isActiveTarget){
     fill(255,0,0); 
    }else{
     fill(255,255,255); 
    }
  ellipse(x,y,currentWid,currentWid); 
  }
  
  public boolean checkCoords() { //returns true if mouse was clicked within the buttons coords
  //println("my X bounding box is within " + (x - currentWid/2+400) + "-" + (x + currentWid/2+400));
  //println("my Y bounding box is within " + (y - currentWid/2+400) + "-" + (y + currentWid/2+400));
   if (mouseX <= x + currentWid/2+500 && mouseX >= x - currentWid/2+500){//checks x
     if (mouseY <= y + currentWid/2+500 && mouseY >= y - currentWid/2+500){//checks y
   return true; }
 }
   return false;
}
}
