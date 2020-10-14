import 'dart:convert';
import '../services/Services.dart';
import '../util/Util.dart';

class UserModel{
  int id;
  String name;
  String login;
  int free;

  UserModel({this.name, this.login, this.free});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name : json['name'],
    free: int.parse(json['free']),
  );

  static Future<UserModel> authentication({String login, String password, String token}) async {
    final response = await Services.fetchArray("apptec.php?login=$login&pass=$password&token=$token");
    if(response == Messages.NOT_CONECTION)
      return null;

    List result = jsonDecode(response.body);

    UserModel user = UserModel();
    
    if(result[0]['success']){
      user = UserModel.fromJson(result[0]);
      user.login = login;
    }

    Auth.user = user;

    return user;

  }

  Future<bool> loged() async {
    final response = await Services.fetchArray("apploged.php?login=$login");
    if(response == Messages.NOT_CONECTION)
      return null;

    List result = jsonDecode(response.body);      
    if(result[0]['free']==1)
      return false;
      
    return true;
  }

  Future<UserModel> logout() async {
    final response = await Services.fetchArray("appteclogout.php?login=$login");
    if(response == Messages.NOT_CONECTION)
      return null;

    List result = jsonDecode(response.body);
    UserModel user;
      
    user = UserModel.fromJson(result[0]);
    user.login = login;

    Auth.user = user;

    return user;

  }  

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
        if (id != null) {
            map['id'] = id;
        }
    map['name'] = name;
    map['login'] = login;
    return map;
 }
 
 UserModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.login = map['login'];
 }
 
}