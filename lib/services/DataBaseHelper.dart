import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/UserModel.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String databaseName = 'ntelgos';
  String table = 'table_user';
  String colId = 'id';
  String colName = 'name';
  String colLogin = 'login';

  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
        _databaseHelper = DatabaseHelper._createInstance();
    }
  
  return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
        _database = await inicializeDatabase();
    }
  
  return _database;
  }
  Future<Database> inicializeDatabase() async {
    Directory diretorio = await getApplicationDocumentsDirectory();
    String path = diretorio.path + databaseName;
    
    var bandoDeContatos = await openDatabase
    (path, version: 1,  onCreate: _criaBanco);
  return bandoDeContatos;
  }
  void _criaBanco(Database db, int versao) async {
    await db.execute('CREATE TABLE $table('
    '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
    '$colName TEXT,'
    '$colLogin TEXT);');
 
  }

  Future<List<Map<String, dynamic>>> getUserMap() async {
    Database db = await this.database;
    var result = await db.rawQuery("SELECT * FROM $table");
  return result;
  }

  Future<int> insertUser(UserModel user) async {
    Database db = await this.database;
    var result = await db.insert(table, user.toMap());
  return result;
  }

  Future<int> updateUser(UserModel user,int id) async {
    var db = await this.database;
    var result = await db.rawUpdate("UPDATE $table SET $colName = '${user.name}', $colLogin = '${user.login}' WHERE $colId = '$id'");
  return result;
  }
  
  Future<int> deleteUser(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $colId = $id');
  return result;
  }

}