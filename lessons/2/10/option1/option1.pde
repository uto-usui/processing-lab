import controlP5.*;

ControlP5 cp5; // ControlP5ライブラリのインスタンス
Textfield textfieldA, textfieldB; // xとy座標を入力するテキストフィールド
DropdownList dropdownList; // 形状を選択するドロップダウンリスト
Button buttonA, buttonB; // 描画と消去のボタン

int shapeX = -1, shapeY = -1; // 描画する形状のxとy座標
int shapeType = -1; // 描画する形状のタイプ（0 = 円, 1 = 正方形）

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this); // ControlP5のインスタンスを作成
  
  // x座標を入力するテキストフィールド
  textfieldA = cp5.addTextfield("textfieldA")
                  .setPosition(20, 20)
                  .setSize(100, 20)
                  .setText("100");
                  
  // y座標を入力するテキストフィールド
  textfieldB = cp5.addTextfield("textfieldB")
                  .setPosition(20, 50)
                  .setSize(100, 20)
                  .setText("100");
                  
  // 形状を選択するドロップダウンリスト
  dropdownList = cp5.addDropdownList("dropdownList")
                    .setPosition(20, 80)
                    .setSize(100, 80)
                    .setBarHeight(18)
                    .setItemHeight(18)
                    .setFont(createFont("ＭＳ ゴシック", 12))
                    .close();
                    
  dropdownList.addItem("円", 0); // 円の選択肢
  dropdownList.addItem("正方形", 1); // 正方形の選択肢
  
  // 描画ボタン
  buttonA = cp5.addButton("buttonA")
               .setPosition(20, 200)
               .setSize(100, 20)
               .setLabel("描画")
               .setFont(createFont("ＭＳ ゴシック", 18));
               
  // 消去ボタン
  buttonB = cp5.addButton("buttonB")
               .setPosition(20, 220)
               .setSize(100, 20)
               .setLabel("消去")
               .setFont(createFont("ＭＳ ゴシック", 18));
}

void draw() {
  background(255); // 背景を白に設定
  
  // 形状が選択されている場合、描画
  if (shapeX >= 0 && shapeY >= 0) {
    if (shapeType == 0) {
      ellipse(shapeX, shapeY, 100, 100); // 円を描画
    } else if (shapeType == 1) {
      rect(shapeX, shapeY, 100, 100); // 正方形を描画
    }
  }
}

// 描画ボタンがクリックされたときの処理
void buttonA() {
  background(255);
  
  // 座標と形状タイプを取得
  shapeX = int(textfieldA.getText());
  shapeY = int(textfieldB.getText());
  shapeType = int(dropdownList.getValue());
  
  // 選択された形状を描画
  if (shapeType == 0) {
    ellipse(shapeX, shapeY, 100, 100); // 円を描画
  } else if (shapeType == 1) {
    rect(shapeX, shapeY, 100, 100); // 正方形を描画
  }
}

// 消去ボタンがクリックされたときの処理
void buttonB() {
  background(255); // 背景を白に設定
  
  // 形状の座標をリセット
  shapeX = -1;
  shapeY = -1;
}
