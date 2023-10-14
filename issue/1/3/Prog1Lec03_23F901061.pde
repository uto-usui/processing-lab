void setup() {
  size(300, 200);  // キャンバスのサイズを設定
  noLoop();  // draw関数を1回だけ実行するように設定
}

void draw() {
  background(255);  // 背景色を白に設定

  // 黒のストライプ
  fill(0);  // 塗り色を黒に設定
  rect(0, 0, width/3, height);  // 左側のストライプを描画

  // 黄のストライプ
  fill(255, 204, 0);  // 塗り色を黄色に設定
  rect(width/3, 0, width/3, height);  // 中央のストライプを描画

  // 赤のストライプ
  fill(204, 0, 0);  // 塗り色を赤に設定
  rect(2*width/3, 0, width/3, height);  // 右側のストライプを描画
}
