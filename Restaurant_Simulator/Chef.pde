//Chef class//
class Chef {
  String name;
  int cookingSkill;
  int speed;
  color skinColor;
  
  //Constructor//
  Chef(String n, int c, int s, color sc) {
    this.name = n;
    this.cookingSkill = c;
    this.speed = s;
    this.skinColor = sc;
  }
  
  /*void drawChefs() {
    for (int i = 0; i < res.numChefs; i++) {
      Chefs.add(new Chef("Gustavo", int(random(0, 100)), int(random(0, 100)), color(200, 200, 200)));
      fill(Chefs.get(i).skinColor);
      square(750, (height / res.numChefs) + 90 * i, 90);
  }
  }*/
  
}
