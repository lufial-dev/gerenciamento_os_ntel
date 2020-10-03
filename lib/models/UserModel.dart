import 'dart:convert';
import '../services/Services.dart';
import '../util/Util.dart';

class UserModel{
  String name;
  String login;
  String password;
  

  UserModel({this.name, this.login, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name : json['name'],
  );

  static Future<UserModel> authentication({String login, String password}) async {
    final response = await Services.fetchArray("apptec.php?login=$login&pass=$password");
    List result = jsonDecode(response.body);

    print(result);
 
    UserModel user;
      
    user = UserModel.fromJson(result[0]);
    user.login = login;
    user.password = password;

    Auth.user = user;

    return user;

  }
}