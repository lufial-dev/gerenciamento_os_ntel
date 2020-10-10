import 'package:gerenciamento_os_ntel/services/DataBaseHelper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/UserModel.dart';

class DataUserHelper {

  static String table = 'table_user';
  static String colId = 'id';
  static String colName = 'name';
  static String colLogin = 'login';

  DatabaseHelper database = DatabaseHelper();



  Future<List<Map<String, dynamic>>> getUserMap() async =>
    await database.inicializeDatabase().then((value) async {
      Database db = await database.database;
      var result = await db.rawQuery("SELECT * FROM $table");
      return result;
    });
    

  Future<int> insertUser(UserModel user) async {
    Database db = await database.database;
    var result = await db.insert(table, user.toMap());
  return result;
  }

  Future<int> updateUser(UserModel user,int id) async {
    var db = await database.database;
    var result = await db.rawUpdate("UPDATE $table SET $colName = '${user.name}', $colLogin = '${user.login}' WHERE $colId = '$id'");
  return result;
  }
  
  Future<int> deleteUser(int id) async {
    var db = await database.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $colId = $id');
    return result;
  }

}