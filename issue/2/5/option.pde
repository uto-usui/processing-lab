String[] linesPosX;
String[] linesPosY;
int[] posX;
int[] posY;

void setup() {
  size(400, 400);
  background(255); // 白色の背景

  // ファイルからデータを読み込む
  linesPosX = loadStrings("posx.txt");
  linesPosY = loadStrings("posy.txt");

  // 座標データを整数型の配列に変換
  posX = new int[linesPosX.length];
  posY = new int[linesPosY.length];
  for (int i = 0; i < linesPosX.length; i++) {
    posX[i] = int(linesPosX[i]);
    posY[i] = int(linesPosY[i]);
  }

  // それぞれの座標に円を描画
  fill(0); // 黒色で塗りつぶし
  noStroke();
  for (int i = 0; i < posX.length; i++) {
    ellipse(posX[i], posY[i], 20, 20); // 半径10の円を描画
  }
}

void draw() {
  // このプログラムではdraw関数内での描画は行いません
}
