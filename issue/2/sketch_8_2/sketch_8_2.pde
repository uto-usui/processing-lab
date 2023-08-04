// クイズゲームの変数を初期化
String[] lines; // 質問ファイルから読み取る行
int currentQuestion = 0; // 現在の質問インデックス
int correctAnswers = 0; // 正しい回答の数
String[][] questions; // 質問と選択肢を格納する配列
int gameState = 0; // ゲームの状態: 0 = 問題, 1 = 選択肢, 2 = 結果, 3 = 終了
int resultTimer = 0; // 結果画面のタイマー（未使用）
boolean isAnswering = true; // 回答中かどうかのフラグ

// 初期設定
void setup() {
  size(400, 400); // ウィンドウのサイズ
  
  PFont font = createFont("YuMin-Medium",24); // フォントの作成
  textFont(font); // フォントの適用
  
  lines = loadStrings("questions.txt"); // 質問ファイルの読み込み
  questions = new String[lines.length][6]; // 質問と選択肢の配列を初期化
  
  // ファイルから質問と選択肢を読み取り
  for (int i = 0; i < lines.length; i++) {
    questions[i] = split(lines[i], ',');
  }
}

// オープニング画面を描画
void drawOpening() {
  textSize(20);
  text("問題！", width/2, height/2);
  textAlign(CENTER, CENTER);
}

// 選択肢を描画
void drawSelection() {
  textSize(20);
  text(questions[currentQuestion][0], width/2, height/4);
  textAlign(CENTER, CENTER);
  
  textSize(15);
  // 選択肢を描画
  for (int i = 2; i < questions[currentQuestion].length; i++) {
    text(i-1 + ". " + questions[currentQuestion][i], width/2, height/4 + i*50);
    textAlign(CENTER, CENTER);
  }
}

// 結果画面を描画
void drawResult() {
  textSize(20);

  int answer = -1;
  // ユーザーがクリックした選択肢を検索
  for (int i = 2; i < questions[currentQuestion].length; i++) {
    float x = width/2;
    float y = height/4 + i*50;
    if (dist(mouseX, mouseY, x, y) < 25) {
      answer = i-1;
      break;
    }
  }
     
  // 選択肢がクリックされた場合
  if (answer != -1) {
    // 正解かどうかを判定
    if (questions[currentQuestion][1].equals(str(answer))) {
      text("正解！", width/2, height/2);
      
      // 正解数を増やす
      if(isAnswering) {
        correctAnswers++;
        print("isAnswering:", isAnswering);
        print(" correctAnswers:", correctAnswers);
        isAnswering = false;
      }
    } else {
      // 不正解の場合、正解を表示
      text("不正解", width/2, height/2-30);
      text("正しい答え: " + questions[currentQuestion][Integer.parseInt(questions[currentQuestion][1])+1], width/2, height/2+30);
    }
  }
}

// エンディング画面を描画
void drawEnding() {
  textSize(20);
  text("合計の回答数: " + correctAnswers + "/" + questions.length, width/2, height/2); 
  textAlign(CENTER,CENTER);
}

// ゲームのメインループ
void draw() {
  background(200); // 背景色
  // ゲームの状態に応じて描画
  if (gameState == 0) {
    drawOpening();
  } else if (gameState == 1) {
    drawSelection();
  } else if (gameState == 2) {
    drawResult();
  } else if (gameState == 3) { 
    drawEnding();
  }
}

// マウスクリック時の処理
void mousePressed() {
  if (gameState == 0) {
    gameState = 1; // 問題から選択肢へ
  } else if (gameState == 1) {
    gameState = 2; // 選択肢から結果へ
  } else if (gameState == 2) {
    currentQuestion++;
    
    // 全ての問題に回答した場合、ゲームを終了
    if (currentQuestion >= questions.length) {
      gameState = 3; // 結果から終了へ
    } else {
      gameState = 0; // 次の問題へ
    }
    
    isAnswering = true;
  }
}
