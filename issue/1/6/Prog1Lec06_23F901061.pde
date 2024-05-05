void setup() {
  size(400, 400);
  background(255);
  noLoop();
}

void draw() {
  int numPatterns = 10; // 生成するパターンの数を10に設定
  float patternWidth = width / (2 * numPatterns); // 各パターンの幅

  stroke(0); // borderの色を黒に設定
  strokeWeight(2); // borderの太さを2に設定

  for (int i = 0; i < numPatterns; i++) {
    float size = width - i * 2 * patternWidth; // 各正方形のサイズ

    // 奇数と偶数のインデックスで色を交互に設定
    if (i % 2 == 0) {
      fill(0, 0, 255); // 奇数インデックスでは青色
    } else {
      fill(0, 255, 0); // 偶数インデックスでは緑色
    }

    // 単一のrect()で正方形を描画
    rect(i * patternWidth, i * patternWidth, size, size);
  }
}
