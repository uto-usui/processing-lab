import controlP5.*;

ControlP5 cp5;
Textfield textfieldA;
Textfield textfieldB;
DropdownList dropdownList;
Button buttonA;
Button buttonB;

int shapeX = -1;
int shapeY = -1;
int shapeType = -1;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  
  textfieldA = cp5.addTextfield("textfieldA")
                  .setPosition(20, 20)
                  .setSize(100, 20)
                  .setText("100");
                  
  textfieldB = cp5.addTextfield("textfieldB")
                  .setPosition(20, 50)
                  .setSize(100, 20)
                  .setText("100");
                  
  dropdownList = cp5.addDropdownList("dropdownList")
                    .setPosition(20, 80)
                    .setSize(100, 80)
                    .setBarHeight(18)
                    .setItemHeight(18)
                    .setFont(createFont("ＭＳ ゴシック", 12))
                    .close();
                    
  dropdownList.addItem("円", 0);
  dropdownList.addItem("正方形", 1);
  
  buttonA = cp5.addButton("buttonA")
               .setPosition(20, 200)
               .setSize(100, 20)
               .setLabel("描画")
               .setFont(createFont("ＭＳ ゴシック", 18));
               
  buttonB = cp5.addButton("buttonB")
               .setPosition(20, 220)
               .setSize(100, 20)
               .setLabel("消去")
               .setFont(createFont("ＭＳ ゴシック", 18));
}

void draw() {
  background(255);
  
  if (shapeX >= 0 && shapeY >= 0) {
    if (shapeType == 0) {
      ellipse(shapeX, shapeY, 100, 100);
    } else if (shapeType == 1) {
      rect(shapeX, shapeY, 100, 100);
    }
  }
}

void buttonA() {
  background(255);
  
  shapeX = int(textfieldA.getText());
  shapeY = int(textfieldB.getText());
  shapeType = int(dropdownList.getValue());
  
  if (shapeType == 0) {
    ellipse(shapeX, shapeY, 100, 100);
  } else if (shapeType == 1) {
    rect(shapeX, shapeY, 100, 100);
  }
}

void buttonB() {
  background(255);
  
  shapeX = -1;
  shapeY = -1;
}
