class Circle {
  int r;
  int positionX;
  int positionY;

  Circle(int rr, int x, int y) {
    r = rr;
    positionX = x;
    positionY = y;
  }

  void drawShape() {
    ellipse(positionX, positionY, r, r);
  }
  
  void addCircle(ArrayList<Circle> circles) {
    Circle lastCircle = circles.get(circles.size() - 1);
    float rand = random(0, 4);
    
    int newX = lastCircle.positionX;
    int newY = lastCircle.positionY;
    
    if (rand < 1) {
      if (lastCircle.positionX + lastCircle.r < width) {
        newX = lastCircle.positionX + lastCircle.r;
      }
    } else if (rand >= 1 && rand < 2) {
      if (lastCircle.positionX - lastCircle.r > 0) {
        newX = lastCircle.positionX - lastCircle.r;
      }
    } else if (rand >= 2 && rand <3) {
      if (lastCircle.positionY - lastCircle.r >0) {
        newY = lastCircle.positionY - lastCircle.r;
      }
     } else{
       if(lastCircle.positionY +lastCircle.r<height){
         newY = lastCircle.positionY + lastCircle.r;
       }
     }
     
     if (!isOverlap(circles, newX, newY)) {
       circles.add(new Circle(r, newX, newY));
     }
  }

  boolean isOverlap(ArrayList<Circle> circles, int x, int y) {
     for (Circle circle : circles) {
       if (circle.positionX == x && circle.positionY == y) {
         return true;
       }
     }
     return false;
  }
}

ArrayList<Circle> circles1 = new ArrayList<Circle>();
ArrayList<Circle> circles2 = new ArrayList<Circle>();
ArrayList<Circle> circles3 = new ArrayList<Circle>();

void setup() {
  size(600, 600);
  
  circles1.add(new Circle(30, width/2, height/2));
  circles2.add(new Circle(15, width/2, height/2));
  circles3.add(new Circle(5, width/2, height/2));
}

void draw() {
  background(255);
  
  for (Circle circle : circles1) {
    circle.drawShape();
  }
  for (Circle circle : circles2) {
    circle.drawShape();
  }
  for (Circle circle : circles3) {
    circle.drawShape();
  }
  
  Circle lastCircle = circles1.get(circles1.size() - 1);
  lastCircle.addCircle(circles1);
  
  Circle lastCircle2 = circles2.get(circles2.size() - 1);
  lastCircle2.addCircle(circles2);
  
  Circle lastCircle3 = circles3.get(circles3.size() - 1);
  lastCircle3.addCircle(circles3);
  
  frameRate(4);
}
