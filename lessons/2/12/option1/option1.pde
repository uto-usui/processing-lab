class Circle {
  int r; // 半径
  int positionX, positionY; // 位置

  // コンストラクタ
  Circle(int rr, int x, int y) {
    r = rr;
    positionX = x;
    positionY = y;
  }

  // 円を描画
  void drawShape() {
    ellipse(positionX, positionY, r, r);
  }
  
  // 円を配列に追加
  void addCircle(ArrayList<Circle> circles) {
    Circle lastCircle = circles.get(circles.size() - 1); // 最後の円
    float rand = random(0, 4); // ランダムな方向

    int newX = lastCircle.positionX;
    int newY = lastCircle.positionY;
    
    // 方向に基づいて新しい座標を計算
    if (rand < 1) {
      if (lastCircle.positionX + lastCircle.r < width) {
        newX = lastCircle.positionX + lastCircle.r;
      }
    } else if (rand >= 1 && rand < 2) {
      if (lastCircle.positionX - lastCircle.r > 0) {
        newX = lastCircle.positionX - lastCircle.r;
      }
    } else if (rand >= 2 && rand < 3) {
      if (lastCircle.positionY - lastCircle.r > 0) {
        newY = lastCircle.positionY - lastCircle.r;
      }
    } else {
      if (lastCircle.positionY + lastCircle.r < height) {
        newY = lastCircle.positionY + lastCircle.r;
      }
    }
     
    // 重複していない場合、新しい円を追加
    if (!isOverlap(circles, newX, newY)) {
      circles.add(new Circle(r, newX, newY));
    }
  }

  // 重複チェック
  boolean isOverlap(ArrayList<Circle> circles, int x, int y) {
    for (Circle circle : circles) {
      if (circle.positionX == x && circle.positionY == y) {
        return true; // 重複する場合、trueを返す
      }
    }
    return false; // 重複しない場合、falseを返す
  }
}

ArrayList<Circle> circles1 = new ArrayList<Circle>(); // 半径30の円の配列
ArrayList<Circle> circles2 = new ArrayList<Circle>(); // 半径15の円の配列
ArrayList<Circle> circles3 = new ArrayList<Circle>(); // 半径5の円の配列

void setup() {
  size(600, 600);
  
  // 各配列に最初の円を追加
  circles1.add(new Circle(30, width/2, height/2));
  circles2.add(new Circle(15, width/2, height/2));
  circles3.add(new Circle(5, width/2, height/2));
}

void draw() {
  background(255); // 背景を白に設定
  
  // 全ての円を描画
  for (Circle circle : circles1) { circle.drawShape(); }
  for (Circle circle : circles2) { circle.drawShape(); }
  for (Circle circle : circles3) { circle.drawShape(); }
  
  // 最後の円から新しい円を追加
  Circle lastCircle = circles1.get(circles1.size() - 1);
  lastCircle.addCircle(circles1);
  
  Circle lastCircle2 = circles2.get(circles2.size() - 1);
  lastCircle2.addCircle(circles2);
  
  Circle lastCircle3 = circles3.get(circles3.size() - 1);
  lastCircle3.addCircle(circles3);
  
  frameRate(4); // フレームレートを4に設定
}
