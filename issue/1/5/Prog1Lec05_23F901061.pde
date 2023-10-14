void setup() {
  size(350, 200);  // キャンバスのサイズを設定
  background(255);  // 背景色を白に設定
  noLoop();  // draw関数を1回だけ実行するように設定
}

void draw() {
  int squareSize = 40;  // 正方形の一辺の長さ
  int startX = 40;  // 左端の正方形の頂点のx座標
  int startY = 40;  // 左端の正方形の頂点のy座標

  // for文を使用して6つの正方形を描画
  for (int i = 0; i < 6; i++) {
    rect(startX + i * squareSize, startY, squareSize, squareSize);
  }
}
