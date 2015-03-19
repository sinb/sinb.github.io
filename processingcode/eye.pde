float theta = 0;

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  stroke(0);

  translate(width/2, height/2);

  for (float i = 0; i < TWO_PI; i += 0.2) {

    pushMatrix(); 
   rotate(theta + i);
    line(0, 0, 100, 0);

    // Loop from 0 to 360 degrees (2*PI radians)
    for (float j = 0; j < TWO_PI; j += 0.5) {
      // Push, translate, rotate and draw a line!
 //     pushMatrix();
      translate(100, 0);
      rotate(-theta-j);
      line(0, 0, 50, 0);
      // We're done with the inside loop, pop!
 //     popMatrix();
    }

  
   
  popMatrix();
 }

  // Increment theta
  theta += 0.01;
}
