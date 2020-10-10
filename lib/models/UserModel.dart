import 'dart:convert';
import '../services/Services.dart';
import '../util/Util.dart';

class UserModel{
  int id;
  String name;
  String login;

  UserModel({this.name, this.login});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name : json['name'],
  );

  static Future<UserModel> authentication({String login, String password}) async {
    final response = await Services.fetchArray("apptec.php?login=$login&pass=$password");
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