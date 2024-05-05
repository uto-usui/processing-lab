int[] data = new int[10];
int minDiameter = 300;
int maxDiameter = 1;

void setup() {
  size(400, 400);
  background(255); // 白色の背景

  // 配列をランダムな値で初期化
  for (int i = 0; i < data.length; i++) {
    data[i] = int(random(1, 301)); // 1～300のランダムな値
    // 最小値と最大値を見つける
    if (data[i] < minDiameter) {
      minDiameter = data[i];
    }
    if (data[i] > maxDiameter) {
      maxDiameter = data[i];
    }
  }

  // 最大値を直径とする円を青色で描画
  fill(0, 0, 255); // 青色
  noStroke();
  ellipse(width / 2, height / 2, maxDiameter, maxDiameter);
  
  // 最小値を直径とする円を赤色で描画
  fill(255, 0, 0); // 赤色
  ellipse(width / 2, height / 2, minDiameter, minDiameter);
}

void draw() {
  // このプログラムではdraw関数内での描画は行いません
}
