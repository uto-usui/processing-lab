class MyRect {
  int x; // 四角形の位置の x 座標
  int y; // 四角形の位置の y 座標
  int width; // 四角形の幅
  int height; // 四角形の高さ

  // コンストラクタ
  MyRect(int tempX, int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    width = tempW;
    height = tempH;
  }

  // 四角形の面積を求めるメソッド
  int getArea() {
    return width * height;
  }

  // 四角形を描画するメソッド（線の太さを指定）
  void drawShape(int weight) {
    strokeWeight(weight); // 線の太さを設定
    rect(x, y, width, height);
  }

  // 引数で受け取ったMyRectオブジェクトの面積と自身の面積を合計して返すメソッド
  int sumArea(MyRect rect) {
    return this.getArea() + rect.getArea();
  }
}

void setup() {
  size(400, 400);
  MyRect rect1 = new MyRect(20, 20, 40, 30);
  MyRect rect2 = new MyRect(30, 50, 20, 40);

  println(rect1.sumArea(rect2)); // 結果として2000となる
}

void draw() {
  background(255); // 背景を白に設定

  // 四角形を描画（線の太さを指定）
  MyRect rect1 = new MyRect(20, 20, 40, 30);
  rect1.drawShape(3); // 線の太さを3に設定
  MyRect rect2 = new MyRect(30, 50, 20, 40);
  rect2.drawShape(1); // 線の太さを1に設定
}
