Timer timer;
Donut[] d;
Catcher c;
PImage back_img,back_img2;
int totalDrops = 0;
boolean gameStatus = false;
int dohCount = 0;
int doh_y = 10;
String display_doh = "";
void setup() {
  size(510,765);
  smooth();
  back_img = loadImage("homer_backg.jpg"); 
  back_img2 = loadImage("homer_backg2.jpg"); 
  d = new Donut[1000];
  c = new Catcher();
  timer = new Timer(300);   
  timer.start();                 
}
void draw(){
 // println(gameStatus,dohCount);
  if(gameStatus == true){
    if(dohCount > 10){
      gameStatus = false;
      dohCount = 0;  
    }    
    background(back_img2);
    text(display_doh, 10, 20);
    c.setLocation(mouseX-30, mouseY-30);
    c.display();
    if(timer.isFinished()){
      d[totalDrops] = new Donut();
      totalDrops++;
      if(totalDrops>=d.length){
        totalDrops = 0;
      }
    timer.start();
    }
    for(int i=0; i<totalDrops; i++){
      d[i].move();
      d[i].display();
      if(d[i].reachedBottom() && d[i].wasted == false){
        c.doh = true;
        d[i].wasted = true;
        dohCount++;
        display_doh += "d'oh!!\n";
 
      }
      if(c.intersect(d[i])){
      c.doh = false;
      d[i].caught();
      }
    }
  }
  else{
    background(back_img);
  }
  
}
void mouseClicked(){
  gameStatus = true;
//  println("click!!!!!!",gameStatus);


      display_doh = "";
  totalDrops = 0;
  c.doh = false;

}

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
class Donut{
  PImage Donut_img;
  float x, y, speed;
  boolean wasted;
  Donut(){
    wasted = false;
    x = random(width);
    y = -50;
    speed = random(1, 5);
    Donut_img = loadImage("donut.png");
  }
  void move(){
    y += speed;
  }
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if (y > height + 50) { 
      return true;
    } else {
      return false;
    }
  }
  void display() {
  image(Donut_img, x, y);
  }
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
  }
}
class Catcher {
  PImage homer_eat_img, homer_doh_img;
  float x,y; // location
  boolean doh;
  Catcher() {
    x = 0;
    y = 0;
    homer_eat_img = loadImage("homer_eat.png");
    homer_doh_img = loadImage("homer_doh.png");
    doh = false;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    if(doh){
      image(homer_doh_img, x, y);
      
    }
    else
      image(homer_eat_img, x, y);
  }
  
  // A function that returns true or false based on
  // if the catcher intersects a raindrop
  boolean intersect(Donut d) {
    // Calculate distance
    float distance = dist(x,y,d.x,d.y); 
    
    // Compare distance to sum of radii
    if (distance < 20) { 
      return true;
    } else {
      return false;
    }
  }
}
