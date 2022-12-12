//Food class//
class Food {
  
  //Food variables
  
  String foodName;
  Customer personWhoServed;
  Chef chefWhoCooked;
  Waiter waiterWhoWaited;
  
  Food (String f, Customer c, Chef ch, Waiter w){
    this.foodName = f;
    this.personWhoServed = c;
    this.chefWhoCooked = ch;
    this.waiterWhoWaited = w;
  }
}
