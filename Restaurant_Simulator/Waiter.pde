//Waiter class//
class Waiter { 
  String name;
  int competency;
  int behaviour;
  int speed;
  int posX = 1200;
  int posY = 900;
  int wait = 500;
  int chefWait = 500;
  color skinColor;
  
  boolean isWaitering = false;
  boolean isServing = false;
  boolean foundChef = false;
  boolean servingFood = false;
  
  int incorrectFood = 0;
  int chance;
  int chefIndex;
  int counter = 0;
  Chef chefTarget;
  
  Customer target;
  
  
  Waiter (String n, int c, int b, int s, color sc) {
    this.name = n;
    this.competency = c;
    this.behaviour = b;
    this.speed = s;
    this.skinColor = sc;
  }
  
  void drawWaiter() {
    int yip = 0;
    if (this.isWaitering == false && this.isServing == false) {
      for (int c = 0; c < Customers.size(); c++) {
        for (int w = 0; w < Waiters.size(); w++) {
          if (Waiters.get(w).target != Customers.get(c)) {
            if (Customers.get(c).timeIn > yip && Customers.get(c).isBeingWaitered == false) {
              yip = Customers.get(c).timeIn;
              this.target = Customers.get(c);
              this.target.isBeingWaitered = true;
              this.chance = int(random(0, 50));
              this.incorrectFood = int(random(0, food.length));
              this.isWaitering = true;
            }
          }
        }
      }
    }
      if (this.target != null && target.isGone == false && this.servingFood == false) {
        if ((600 / res.columnTables) * this.target.tableTarget1 + 100 < this.posY && this.isServing == false) {
          this.posY -= this.speed;
          fill(this.skinColor);
          square(this.posX, this.posY, 50);
        }
      /* else if ((600 / res.columnTables) * this.target.tableTarget1 + 100 > this.posY && this.isServing == false) {
          this.posY += this.speed;
          fill(this.skinColor);
          square(this.posX, this.posY, 50);
        } */
      
        else if ((700 / res.rowTables) * this.target.tableTarget2 + 300 < this.posX && this.isServing == false) {
          this.posX -= this.speed;
          fill(this.skinColor);
          square(this.posX, this.posY, 50);
        }
        
        else {
          target.angerTimer += int(random(2000, 4000));
          this.target.isBeingServed = true;
          this.takeOrder();
          
        }
      if (this.target.isGone == true) {
        this.isWaitering = false;
      }
    }
    if (this.servingFood == true) {
      this.chefTarget.isFinished = false;
      fill(255);
      if (food[this.chefIndex] == "Spaghetti") {
        circle(this.posX + 120, this.posY + 50, 70);
        fill(color(196, 137, 88));
       }
          
       else if (food[this.chefIndex] == "Pizza") {
         circle(this.posX + 100, this.posY + 50, 70);
         fill(color(100, 20, 15));
       }
              
       else if (food[this.chefIndex] == "Chicken pot pie") {
         circle(this.posX + 100, this.posY + 50, 70);
         fill(color(10, 190, 210));
       }
              
       else if (food[this.chefIndex] == "Tomato soup") {
         circle(this.posX + 100, this.posY + 50, 70);
         fill(color(200, 10, 20));
       }
      square(this.posX + 100, this.posY + 50, 30);
      fill(this.skinColor);
      square(this.posX + 100, this.posY + 100, 50);
      chefTarget.isFinished = false;
      if (this.target.cusX < this.posX && ((700 / res.rowTables) * this.target.tableTarget2 + 250 <= this.target.cusX)) {
        this.posX -= this.speed;
      }
      else {
        this.isWaitering = false;
        this.isServing = false;
        this.foundChef = false;
        this.servingFood = false;
        this.target.isEating = true;
        this.chefTarget.waiterTarget = null;
        this.chefTarget = null;
        Waiters.remove(this);
        Waiters.trimToSize();
      }
    }
  }
  
  void takeOrder() {
    if (this.wait == 0) {
      counter++;
      this.isServing = true;
      if (this.posX < 800) {
        this.posX += this.speed;
        fill(this.skinColor);
        square(this.posX, this.posY, 50);
      }
      else if (this.posX >= 800 ) {
        fill(255);
        //ellipse(this.posX + 100, (100 * Waiters.indexOf(this)) + 100, 100, 50);
        if (chance > 2) {
          this.chefIndex = target.index;
          if (food[target.index] == "Spaghetti") {
            fill(color(196, 137, 88));
          }
          
          else if (food[target.index] == "Pizza") {
            fill(color(100, 20, 15));
          }
          
          else if (food[target.index] == "Chicken pot pie") {
            fill(color(10, 190, 210));
          }
          
          else if (food[target.index] == "Tomato soup") {
            fill(color(200, 10, 20));
          }
          //square(this.posX + 80, (100 * Waiters.indexOf(this)) + 80, 25);
            }

        else {
          if (food[this.incorrectFood] == "Spaghetti") {
            fill(color(196, 137, 88));
          }
          
            else if (food[this.incorrectFood] == "Pizza") {
              fill(color(100, 20, 15));
            }
            
            else if (food[this.incorrectFood] == "Chicken pot pie") {
              fill(color(10, 190, 210));
            }
            
            else if (food[this.incorrectFood] == "Tomato soup") {
              fill(color(200, 10, 20));
            }
            this.chefIndex = this.incorrectFood;
            //square(this.posX + 80, (100 * Waiters.indexOf(this)) + 80, 25);
                }
            fill(this.skinColor);
            square(this.posX, this.posY, 50);
            this.findChef();
              }
            }
     else {
       fill(this.skinColor);
       square(this.posX, this.posY, 50);
       this.wait--;
     }
  }
  
void findChef() {
  for (int i = 0; i < Chefs.size(); i++) {
    if (Chefs.get(i).isCooking == false && this.foundChef == false) {
      this.chefTarget = Chefs.get(i);
      this.chefTarget.waiterTarget = this;
      this.chefTarget.chefNumber = i;
      this.foundChef = true;
      chefWait = 500;
    }
    if (this.foundChef == true && chefWait > 0) {
      chefTarget.foodCooking = new Food(food[chefIndex], target, chefTarget, this);
      chefTarget.chefIndex = chefIndex;
      chefTarget.cook();
    }
    else {
      chefWait --;
    }
  }
}

}
