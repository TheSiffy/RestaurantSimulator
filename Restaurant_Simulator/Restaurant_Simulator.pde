import g4p_controls.*;

int r = 3;
int c = 5;
int nc = 6;
int nw = 6;
int st = 10;
color design = color(200, 100, 200);
float cusInflow = 0.01;
ArrayList<Chef> Chefs = new ArrayList<Chef>();
ArrayList<Waiter> Waiters = new ArrayList<Waiter>();
ArrayList<Customer> Customers = new ArrayList<Customer>();
Restaurant res = new Restaurant("Yippee", r, c, st, nc, nw, cusInflow);
boolean[][] Tables = new boolean[res.columnTables][res.rowTables];
boolean paused = false;
color d = color(150, 0, 150);
String[] food = { "Spaghetti", "Pizza", "Chicken pot pie", "Tomato soup"};

void setup() {
  background(0);
  size(1200, 700);
  createGUI();
  for (int i = 0; i < res.columnTables; i++) {
    for (int j  = 0; j < res.rowTables; j++) {
      Tables[i][j] = true;
    }
  }
}

void draw() {
  res.design = d;
  res.drawRestaurant();
  res.createCustomers();
  res.createWaiters();
  res.createChefs();
  for (int i = 0; i < Customers.size(); i++) {
    Customers.get(i).drawCustomer();
  }
  for (int j = 0; j < Waiters.size(); j++) {
    Waiters.get(j).drawWaiter();
  }
  for (int c = 0; c < Chefs.size(); c++) {
    Chefs.get(c).drawChef();
  }
}
