int diameter = 300;

void setup() {
  size(400, 400);
  fill(255);
  stroke(0);

  // 中心から円を描画する
  while (diameter > 0) {
    ellipse(width / 2, height / 2, diameter, diameter);
    diameter -= 30;
  }
}

void draw() {
}
