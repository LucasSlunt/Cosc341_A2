//global vars
int cm = 56; //on my laptop, one centimeter is equal to 56 pixels, and thats the unit of measurement processing uses.
float a1 = 3*cm; float a2 = 5*cm; float a3 = 7*cm;
float[] amplitudeArr = {a1,a2,a3,a2,a3,a1,a2,a3,a1};
float w1 = 0.5*cm; float w2 = cm; float w3 = 1.5*cm;
float[] widthArr = {w2,w1,w3,w3,w1,w1,w2,w2,w3};
float currentAmp = 100;
float currentWid = 100;
Target[] targetArr = new Target[9];
int activeTarget = 0;
int programIterations = 0;
long startTime,endTime,duration;
boolean firstTry = true;

void setup(){
  size(1000,1000);
  translate(width/2,height/2);
  ellipseMode(CENTER);
  println("\n\nNEW SESSION");
  randomizeTargets(programIterations);
  startTime = System.nanoTime();
}

void draw() {
   background(0);
  displayCircles();
 
}

void displayCircles(){
  translate(width/2,height/2);
  for (int i = 0; i < 9; i++) {
   targetArr[i].display(); 
  }
}

void randomizeTargets(int counter){
  //currentAmp = amplitudeArr[(int)random(0,3)];
  //currentWid = widthArr[(int)random(0,3)];
  currentAmp = amplitudeArr[counter]; 
  currentWid = widthArr[counter];
  
  for (int i = 0; i < 9; i++) {
  targetArr[i] = new Target(currentAmp*cos(i*TAU/9),currentAmp*sin(i*TAU/9)); 
  }
  targetArr[activeTarget].isActiveTarget = true;
}

void mousePressed() {
  //println("clicked at: " + mouseX + "," + mouseY);
 if (targetArr[activeTarget].checkCoords()){
      endTime = System.nanoTime();
      duration = (endTime - startTime)/1000000;
      println("Width: " + currentWid + " Amplitude: " + currentAmp + " Time: " + duration + " Correct: " + firstTry);
      firstTry = true;
    targetArr[activeTarget].isActiveTarget = false;
    
    activeTarget = (activeTarget+5)%9; //activeTarget becomes the next one
    targetArr[activeTarget].isActiveTarget = true;
    
    startTime = System.nanoTime();
    if(activeTarget == 0){
      //new iteration of the program
      programIterations++;
      if(programIterations == 9){
       println("tests complete. great job!"); 
      }
      randomizeTargets(programIterations);
    }
  }else{ firstTry = false;}
}
