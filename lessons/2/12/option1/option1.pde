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
  
  void move() {
    float rand = random(0, 4);
  
    if (rand < 1 && positionX + r/2 < width) {
      positionX += r;
    } else if (rand >= 1 && rand < 2 && positionX - r/2 > 0) {
      positionX -= r;
    } else if (rand >= 2 && rand < 3 && positionY - r/2 > 0) {
      positionY -= r;
    } else if (positionY + r/2 < height) {
      positionY += r;
    }
  }
  
  boolean intersects(Circle other) {
    float d = dist(positionX, positionY, other.positionX, other.positionY);
    return d < r/2 + other.r/2;
  }
  
  void resize(int newR) {
    r = newR;
  }
}

Circle circle1;
Circle circle2;

void setup() {
  size(300, 300);
  circle1 = new Circle(30, width/3, height/2);
  circle2 = new Circle(30, width*2/3, height/2);
}

void draw() {
  background(255);
  
  circle1.drawShape();
  circle1.move();
  
  circle2.drawShape();
  circle2.move();
  
  if (circle1.intersects(circle2)) {
    circle1.resize(circle1.r + 10);
    circle2.resize(circle2.r + 10);
  }
  
  frameRate(4);
}
