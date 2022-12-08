//Restaurant Class//
class Restaurant {
  //Restaurant Variables
  String name;
  color design;
  int rowTables; //There has to be at least 1 table
  int columnTables;
  int stars;
  int totalProfit;
  int stinginess;
  int numChefs;
  int numWaiters;
  float cusInflow;

  //Restaurant contructor
  Restaurant(String n, int d, int rnt, int cnt, int st, int nc, int nw, float ci) {
  this.name = n;
  this.design = d;
  this.rowTables = rnt;
  this.columnTables = cnt;
  this.stinginess = st;
  this.numChefs = nc;
  this.numWaiters = nw;
  this.cusInflow = ci;
  }
  
  void drawRestaurant() {
    fill(this.design);
    rect(0, 0, 900, 800); 
    fill(125, 125, 125);
    rect (900, 0, 1100, 800);
    fill(100, 100, 100);
    rect (1100, 0, 1200, 800);
    for (int i = 0; i < this.columnTables; i++) {
      for (int j = 0; j < this.rowTables; j++) {
        fill(200, 100, 50);
        square((700 / this.rowTables) * (j) + 250, (600 / this.columnTables * i) + 50, (700) / (14));
      }
    }
    
  }
  
  void createWaiters() {
      for (int i = 0; i < this.numWaiters; i ++) {
        if (Waiters.size() < this.numWaiters) {
        Waiters.add(new Waiter("Alfredo", int(random(1, 100)), int(random(1,100)), int(random(5, 15)), color(100, 25, 150)));
        fill(Waiters.get(i).skinColor);
        Waiters.get(i).wait = Waiters.get(i).wait/Waiters.get(i).competency;
      }
    }
  }
  
  void createCustomers() {
    if (100 * this.cusInflow > int(random(0, 100))) {
      int y = 0;
    for (int i = 0; i < res.columnTables; i++) {
      for (int j = 0; j < res.rowTables; j++) {
        if (Tables[i][j] == true) {
            Customer n = new Customer("Alfredo", int(random(5, 10)), int(random(0, 1)), int(random(0, 100)), color(0, 200, 30), 100, 0, int(random(5, 30)), int(random(1000, 2000)));
            Customers.add(n);
            n.tableTarget1 = i;
            n.tableTarget2 = j;
            y = 1;
            Tables[i][j] = false;
            break;
          }
        }
        if (y == 1) {
          break;
        }
      }
    }
  }
  
void createChefs() {
  if (Chefs.size() != this.numChefs) {
    for (int i = 0; i < this.numChefs; i++) {
      Chefs.add(new Chef("Gustavo", int(random(0, 100)), int(random(1, 5)), color(200, 200, 200), i * (height/res.numChefs)));
  }
  }
}
}
