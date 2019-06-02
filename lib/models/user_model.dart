class UserModel {

  int id;
  String name, user, password;

  UserModel(this.id, this.name, this.user, this.password);

  UserModel.fromJSHON(Map<String, dynamic> parseJSON){

    id = int.parse(parseJSON['id']);
    name = parseJSON['Name'];
    user = parseJSON['User'];
    password = parseJSON['Password'];

  }

  
}