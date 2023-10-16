int leftX = -1;
int leftY = -1;
int rightX = -1;
int rightY = -1;

void setup() {
  size(640, 480);
}

void draw() {
  if(mousePressed == true)   {
   if(mouseButton == LEFT) {
      leftX = mouseX;
      leftY = mouseY;
    }
  
    if(mouseButton == RIGHT) {
      rightX = mouseX;
      rightY = mouseY;              
    }
    
    if (leftX != -1 && leftY != -1 && rightX != -1 && rightY != -1) {
      rect(leftX, leftY, mouseX - leftX, mouseY - leftY);
    }
  }
}
