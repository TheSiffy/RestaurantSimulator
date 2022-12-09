//Food class//
class Food {
  
  //Food variables
  
  String foodName;
  int price;
  Customer personWhoServed;
  Chef chefWhoCooked;
  Waiter waiterWhoWaited;
  
  Food (String f, Customer c, Chef ch, Waiter w){
    this.foodName = f;
    this.personWhoServed = c;
    this.chefWhoCooked = ch;
    this.waiterWhoWaited = w;
    if(f == "Spaghetti"){
      this.price = 15;
    }
    else if (f=="Pizza"){
      this.price = 17;
    }
    else if(f=="Chicken pot pie"){
      this.price = 12;
    }
    else if(f=="Tomato soup"){
      this.price = 8;
    }
  }
}
