import g4p_controls.*;

//int r = res.rowTables;
//int c = res.columnTables;
ArrayList<Chef> Chefs = new ArrayList<Chef>();
ArrayList<Waiter> Waiters = new ArrayList<Waiter>();
ArrayList<Customer> Customers = new ArrayList<Customer>();
Restaurant res = new Restaurant("Yippee", color(200, 100, 200), 3, 5, 10, 5, 5, 0.02);
boolean[][] Tables = new boolean[res.columnTables][res.rowTables];

void setup() {
  background(0);
  size(1200, 800);
  for (int i = 0; i < res.columnTables; i++) {
    for (int j  = 0; j < res.rowTables; j++) {
      Tables[i][j] = true;
    }
  }
  res.createWaiters();
}

void draw() {
  res.drawRestaurant();
  res.createCustomers();
  for (int i = 0; i < Customers.size(); i++) {
    Customers.get(i).drawCustomer();
  }
  for (int j = 0; j < Waiters.size(); j++) {
    //Waiters.get(j).drawWaiter();
  }
}
