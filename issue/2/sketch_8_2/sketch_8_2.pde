String[] lines;
int currentQuestion = 0;
int correctAnswers = 0;
String[][] questions;
int gameState = 0; // 0: 問題, 1: 選択肢, 2: 結果, 3: 終了
int resultTimer = 0;
boolean isAnswering = true;


void setup() {
  size(400, 400);
  
  PFont font = createFont("YuMin-Medium",24);
  textFont(font);
  
  lines = loadStrings("questions.txt");
  questions = new String[lines.length][6];
  
  for (int i = 0; i < lines.length; i++) {
    questions[i] = split(lines[i], ',');
  }
}

void drawOpening() {
  textSize(20);
  text("問題！", width/2, height/2);
  textAlign(CENTER, CENTER);
}

void drawSelection() {
  textSize(20);
  text(questions[currentQuestion][0], width/2, height/4);
  textAlign(CENTER, CENTER);
  
  textSize(15);
  for (int i = 2; i < questions[currentQuestion].length; i++) {
    text(i-1 + ". " + questions[currentQuestion][i], width/2, height/4 + i*50);
    textAlign(CENTER, CENTER);
  }
}

void drawResult() {
  textSize(20);

    int answer = -1;
    // ユーザーがクリックした選択肢を検索する
    for (int i = 2; i < questions[currentQuestion].length; i++) {
      float x = width/2;
      float y = height/4 + i*50;
      if (dist(mouseX,mouseY,x,y) < 25) {
        answer = i-1;
        break;
      }
    }
     
    //print(answer);
    
    // 選択肢がクリックされた場合
    if (answer != -1) {
      // 正解かどうかを判定する
      if (questions[currentQuestion][1].equals(str(answer))) {
        text("正解！", width/2, height/2);
        
        if(isAnswering) {
          correctAnswers++;
          print("isAnswering:", isAnswering);
          print(" correctAnswers:", correctAnswers);
          isAnswering = false;
        }
      } else {
        text("不正解", width/2, height/2-30);
        text("正しい答え: " + questions[currentQuestion][Integer.parseInt(questions[currentQuestion][1])+1], width/2, height/2+30);
      }
    }
}

void drawEnding() {
  textSize(20);
  text("合計の回答数: " + correctAnswers + "/" + questions.length, width/2, height/2); 
  textAlign(CENTER,CENTER);
}

void draw() {
  background(200);
  // 0: 問題
  if (gameState == 0) {
    drawOpening();
    // 1: 選択肢
  } else if (gameState == 1) {
    drawSelection();
    // 2: 結果
  } else if (gameState == 2) {
    drawResult();
    // 3: 終了
  } else if (gameState == 3) {
    drawEnding();
  }
}

void mousePressed() {
  print(" gameState:");
  print(gameState);
  if (gameState == 0) {
    gameState = 1;
  } else if (gameState == 1) {
    gameState = 2;
  } else if (gameState == 2) {
    currentQuestion++;
    
    // 全ての問題に回答した場合、ゲームを終了する
    if (currentQuestion >= questions.length) {
      gameState = 3;
    } else {
      gameState = 0;
    }
    
    isAnswering = true;
  }
}
