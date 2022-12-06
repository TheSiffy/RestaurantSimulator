//Waiter class//
class Waiter { 
  String name;
  int competency;
  int behaviour;
  int speed;
  int cusX = 1200;
  int cusY = 900;
  color skinColor;
  boolean isWaitering = false;
  
  Customer target = null;
  
  
  Waiter (String n, int c, int b, int s, color sc) {
    this.name = n;
    this.competency = c;
    this.behaviour = b;
    this.speed = s;
    this.skinColor = sc;
  }
  
  void drawWaiter() {
    int yip = 0;
    if (this.isWaitering == false) {
      for (int c = 0; c < Customers.size(); c++) {
        for (int w = 0; w < res.numWaiters; w++) {
          if (Waiters.get(w).target != Customers.get(c)) {
            if (Customers.get(c).timeIn > yip) {
              yip = Customers.get(c).timeIn;
              this.target = Customers.get(c);
              this.isWaitering = true;
            }
          }
        }
      }
    }
      if (this.target != null && target.isGone != true) {
        println("Meow");
        if ((600 / res.columnTables) * this.target.tableTarget1 + 100 < this.cusY) {
          this.cusY -= this.speed;
          fill(this.skinColor);
          square(this.cusX, this.cusY, 50);
        }
      
        else if ((700 / res.rowTables) * this.target.tableTarget2 + 300 < this.cusX) {
          this.cusX -= this.speed;
          fill(this.skinColor);
          square(this.cusX, this.cusY, 50);
        }
        
        else {
          fill(this.skinColor);
          square(this.cusX, this.cusY, 50);
        }
      if (this.target.isGone == true) {
        this.isWaitering = false;
      }
    }
  }
}
