//Customer class //
class Customer {
  //Customer variables
  String name;
  int speed;
  float patience;
  int aggression;
  color skinColor;
  
  int cusX;
  int cusY;
  
  int index;
  int timeIn;
  
  int timer;
  int angerTimer;
  
  int tableTarget1;
  int tableTarget2;
  
  String orderedFood;
  
  boolean isOrdered = false;
  boolean isGone = false;
  
  Customer (String n, int s, float p, int a, color sc, int x, int y, int t, int at) {
    this.name = n;
    this.speed = s;
    this.patience = p;
    this.aggression = a;
    this.skinColor = sc;
    this.cusX = x;
    this.cusY = y;
    this.timer = t;
    this.angerTimer = at;
  }
  
  void drawCustomer() {
    this.timeIn += 1;
    if (this.angerTimer < 0) {
      this.isGone = true;
      Customers.remove(this);
    }
    if (this.isGone == true) {
      if ((700 / res.rowTables) * this.tableTarget2 + 250 < this.cusX) {
        this.cusX = this.cusX - this.speed;
        fill(color(255,0,0));
        square(this.cusX + this.speed, this.cusY, 50);
      }
      else if ((600 / res.columnTables) * this.tableTarget1 + 100 < this.cusY) {
        this.cusY = this.cusY - this.speed;
        fill(color(255,0,0));
        square(this.cusX, this.cusY, 50);
        Tables[this.tableTarget1][this.tableTarget2] = true;
      }
    }
    else {
    if ((600 / res.columnTables) * this.tableTarget1 + 100 > this.cusY) {
      this.cusY += this.speed;
      fill(this.skinColor);
      square(this.cusX, this.cusY, 50);
      }
    else if ((700 / res.rowTables) * this.tableTarget2 + 250 > this.cusX) {
      this.cusX += this.speed;
      fill(this.skinColor);
      square(this.cusX, this.cusY, 50);
      }
    else {
      fill(this.skinColor);
      square(this.cusX, this.cusY, 50);
      this.timer = this.timer - 1;
      this.angerTimer = this.angerTimer - 1;
      this.customerOrder();
      }
    }
    if (this.isGone == true) {
      Tables[this.tableTarget1][this.tableTarget2] = true;
    }
  }
  /*void checkTables() {
    for (int i = 0; i < res.columnTables; i++) {
      for (int j = 0; j < res.rowTables; j++) {
          if (Tables[this.tableTarget1][this.tableTarget2] == false && this.angerTimer < 0) {
            println("Meow");
            Tables[this.tableTarget1][this.tableTarget2] = true;
        }
      }
    }
  }*/
  
  void customerOrder() {
    String[] food = { "Spaghetti", "Pizza", "Chicken pot pie", "Tomato soup"};
    if (this.isOrdered == false) {
    this.index = int(random(food.length));
    this.isOrdered = true;
    }
    
    if (this.angerTimer > 0) {
      fill(255);
      ellipse(this.cusX + 100, this.cusY - 50, 100, 50);
    
    if (food[this.index] == "Spaghetti") {
      fill(color(196, 137, 88));
    }
    
    else if (food[this.index] == "Pizza") {
      fill(color(100, 20, 15));
    }
    
    else if (food[this.index] == "Chicken pot pie") {
      fill(color(10, 190, 210));
    }
    
    else if (food[this.index] == "Tomato soup") {
      fill(color(200, 10, 20));
    }
    square(this.cusX + 87, this.cusY - 60, 25);
    
  }
  else if (this.angerTimer < 0) {
    
  }
  
  }
  
}
