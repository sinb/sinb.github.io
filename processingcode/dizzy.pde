int i = 1;
color[] color_array = {#62FF0D,#E8A20C,#FF0000,#340CE8,#00FFD9};
void setup(){
  size(480,480);
 // background(color_array[0]);
  frameRate(5);
}
void draw(){
  noStroke();

  for(int j = -1; j < 12; j++){
    fill(color_array[(i+j) % color_array.length]);
    rect(20*j,20*j,480-40*j,480-40*j, random(0,30),random(0,30),random(0,30),random(0,30));
  }
  i++;
  a = sketchPath("dizzy.pde");
  text(a, 100, 100);
}
void mousePressed(){
  frameRate(30);
}
void mouseReleased(){
  frameRate(5);
}
