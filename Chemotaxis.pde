PImage vacuum;
Bacteria[] bacteriaArray; 
int numBacteria = 30; 

void setup(){
  size(500, 500);
  bacteriaArray = new Bacteria[numBacteria];
  vacuum = loadImage("image (1).png");
  
  for (int i = 0; i < numBacteria; i++) {
    bacteriaArray[i] = new Bacteria(width /2, height /2);
  }
}

void draw() {
    background(0); // Clear the screen 
    if (mousePressed) {
        float scale = 0.3; // Change this value to make it smaller or larger
        image(vacuum, mouseX - (vacuum.width * scale) / 2, mouseY - (vacuum.height * scale) / 2, 
              vacuum.width * scale, vacuum.height * scale);
    }
    
    for (int i = 0; i < bacteriaArray.length; i++) {
        Bacteria blobs = bacteriaArray[i];
        blobs.move(); // Move the bacteria
        blobs.show(); // Display 
    }
}

class Bacteria{
  int x, y;
  float speedX, speedY;
  float randomWalk = 1;
  float attract = 0.001;
  
  Bacteria(int startX, int startY){
    x = startX;
    y = startY;
    speedX = (int)(Math.random()*0.1);
    speedY = (int)(Math.random()*0.1);
  }
  
  void move(){
    speedX += random(-randomWalk, randomWalk);
    speedY += random(-randomWalk, randomWalk);
    
    if (mousePressed){
      speedX += (mouseX - x) * attract;
      speedY += (mouseY - y) * attract;
    }
    
    x += speedX * 0.5;
    y += speedY * 0.5;
    
    if (x < 0 || x > width) {
            speedX *= -0.01; // Reverse direction with less speed
    }
    if (y < 0 || y > height) {
            speedY *= -0.01;
    }
    
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  void show() {
        fill(0, 255, 0); 
        noStroke();
        ellipse(x, y, 15, 15); 
  }
}
