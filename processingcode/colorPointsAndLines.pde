float key_dragged1 = 0;
float key_dragged2 = 0;
void setup(){
  size(400,200);
  background(0);
  colorMode(HSB,255,255,255,100);
  frameRate(25);
}
void draw(){
  //range x (0.2width, 0.8 width)
  //range y (0.3height, 0.7height)
  for(int x = round(0.1*width); x <= 0.9*width; x++){
    stroke(random(255),random(255),random(255),random(100));
    for(int y = round(0.1*height); y <= 0.9*height; y++)
      {  
       // fill(random(255),random(255));
        if(mousePressed){
        stroke(random(255),random(255),random(255),random(100));
        }
        point(x+20*sin(key_dragged1),y+cos(key_dragged2));
        
      }
  }
}
void mouseDragged(){
  key_dragged1 = random(mouseX);
  key_dragged2 = random(mouseY);  
}
void mouseReleased(){
  key_dragged1 = 0;
  key_dragged2 = 0;  
  background(0);
}
