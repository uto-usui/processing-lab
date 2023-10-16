void setup() {
  size(400, 400);
  background(255);
  noLoop();
}

void draw() {
  int numPatterns = 5; // 生成するパターンの数
  float patternWidth = width / (2 * numPatterns); // 各パターンの幅
  
  stroke(0); // borderの色を黒に設定
  strokeWeight(2); // borderの太さを2に設定
  
  for (int i = 0; i < numPatterns; i++) {
    // 外側の青色部分
    fill(0, 0, 255); // 青色
    float outerSize = width - i * 2 * patternWidth; // 外側の正方形のサイズ
    rect(i * patternWidth, i * patternWidth, outerSize, outerSize);
    
    // 内側の緑色部分
    fill(0, 255, 0); // 緑色
    float innerSize = outerSize - patternWidth; // 内側の正方形のサイズ
    rect((i * patternWidth) + patternWidth/2, (i * patternWidth) + patternWidth/2, innerSize, innerSize);
  }
}
