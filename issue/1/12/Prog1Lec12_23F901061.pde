PFont myFont;  // フォントを格納するための変数


int getNumberOfDivisor(int num) {
  int count = 0;  // 約数の数をカウントするための変数

  for (int i = 1; i <= num; i++) {
    if (num % i == 0) {  // もしiがnumの約数であれば
      count++;  // カウンタを1増やす
    }
  }

  return count;  // 約数の数を返す
}

void setup() {
  size(400, 400); // キャンバスのサイズを400x400に設定
  background(255); // 白色の背景を設定
  
  myFont = createFont("MS Gothic", 32);  // フォントを作成（MS Gothicを使用）
  textFont(myFont);  // フォントを設定
}

void draw() {
  int divisorCount = getNumberOfDivisor(4);  // 約数の数を取得

  fill(0);  // 文字の色を黒に設定
  textSize(32);  // フォントサイズを32に設定
  text("約数の数: " + divisorCount, 50, 200);  // 約数の数をキャンバスに表示
  noLoop();
}
