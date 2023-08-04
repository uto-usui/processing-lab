import controlP5.*; // ControlP5
ControlP5 cp5; // ControlP5オブジェクトの変数の宣言
Button bt0; // Buttonオブジェクトの変数の宣言
DropdownList dl0; // DropdownListオブジェクトの変数の宣言
String[] items = {"りんご","みかん","バナナ","メロン"}; // dlで使う項目の宣言

void setup() {
  size(500,500);
  cp5 = new ControlP5(this); // ControlP5オブジェクトを生成
  bt0 = cp5.addButton("bt0"); // Buttonオブジェクトを生成
  bt0.setPosition(350,10); // 位置設定
  bt0.setSize(100,30); // サイズ設定
  bt0.setFont(createFont("ＭＳ ゴシック",20)); // フォントの設定
  bt0.setLabel("ボタン"); // ボタン上に表示する文字列の設定
  bt0.setColorCaptionLabel(#000000); // ボタン上の文字色の設定
  bt0.setColorBackground(#dddddd); // ボタンの色の設定
  dl0 = cp5.addDropdownList("dl0"); // DropdownListオブジェクトを生成
  dl0.setPosition(350,80); // 位置設定
  dl0.setSize(100,200); // サイズ設定
  dl0.setBarHeight(35); // 最上部の高さ設定
  dl0.setItemHeight(35); // 項目表示部の高さ設定
  dl0.setFont(createFont("ＭＳ ゴシック",20)); // フォントの設定
  dl0.setLabel("リスト"); // 最上部の文字を設定
  dl0.setColorCaptionLabel(#000000); // 最上部の文字色を設定
  dl0.setColorValue(#000000); // 項目の文字色を設定
  dl0.setColorBackground(#FFFFFF); // 背景色の設定
  dl0.addItems(items); // 項目を設定
  dl0.setValue(-1); // 初期値を設定
  dl0.close(); // 閉じた状態でスタート
}

void draw(){
background(#AAAAAA); // 閉じた後に項目表示部が残らないように背景を再描画
}

void bt0(){
  println("設定されている値は" + dl0.getValue() + "です"); // 設定値をコンソールに表示
  int value = int(dl0.getValue()); // 設定値をintに変換
  
  if ((value >= 0) && (value < items.length)){ // 設定値が配列の添字として使えるかチェック
    println("「" + items[value] + "」の項目が選択されています"); // 設定値に対応する項目をコンソールに表示
  }
}
