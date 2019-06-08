class FoodModel {
  
  // Filed
  int id;
  String nameFood, price, detail, imagePath;

  // Constructor
  FoodModel(this.id, this.nameFood, this.price, this.detail, this.imagePath);

  FoodModel.fromJSON(Map<String, dynamic> pareJson){
      id = int.parse(pareJson['id']);
      nameFood = pareJson['NameFood'];
      price = pareJson['Price'];
      detail = pareJson['Detail'];
      imagePath = pareJson['ImagePath'];
  }

}