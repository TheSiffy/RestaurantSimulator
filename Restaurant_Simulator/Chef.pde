//Chef class//
class Chef {
  String name;
  int cookingSkill;
  int speed;
  color skinColor;
  int chefX = 950;
  int chefY;
  int chefSpeed;
  int chefIndex;
  int timeToCook = int(random(2500, 5000));
  Waiter waiterTarget;
  
  Food foodCooking;
  
  boolean isCooking = false;
  boolean isFinished = false;
  
  //Constructor//
  Chef(String n, int c, int s, color sc, int cy) {
    this.name = n;
    this.cookingSkill = c;
    this.speed = s;
    this.skinColor = sc;
    this.chefY = cy;
  }
  
  void drawChef() {
    fill(this.skinColor);
    square(this.chefX, this.chefY, 50);
  }
  
  void cook() {
    if (this.chefX < 1050 && this.isCooking == false) {
      this.chefX += this.speed;
    }
    else if (this.timeToCook > 0 && this.isFinished == false) {
      println("H");
      this.isCooking = true;
      fill(255);
      if (food[this.chefIndex] == "Spaghetti") {
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(196, 137, 88));
      }
      
      else if (food[this.chefIndex] == "Pizza") {
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(100, 20, 15));
      }
          
      else if (food[this.chefIndex] == "Chicken pot pie") {
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(10, 190, 210));
      }
          
      else if (food[this.chefIndex] == "Tomato soup") {
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(200, 10, 20));
     }
     square(this.chefX + 85, this.chefY + 5, 30);
     this.timeToCook--;
   }
   else if (this.chefX > 900 && this.isFinished == false) {
     this.chefX -= this.speed;
     if (food[this.chefIndex] == "Spaghetti") {
       fill(255);
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(196, 137, 88));
      }
      
      else if (food[this.chefIndex] == "Pizza") {
        fill(255);
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(100, 20, 15));
      }
          
      else if (food[this.chefIndex] == "Chicken pot pie") {
        fill(255);
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(10, 190, 210));
      }
          
     else if (food[this.chefIndex] == "Tomato soup") {
       fill(255);
        circle(this.chefX + 100, this.chefY + 20, 70);
        fill(color(200, 10, 20));
     
     }
     square(this.chefX + 85, this.chefY + 5, 30);
   }
   else if (this.isFinished == false) {
     this.waiterTarget.servingFood = true;
     this.isCooking = false;
     this.isFinished = true;
   }
    
  }
}
