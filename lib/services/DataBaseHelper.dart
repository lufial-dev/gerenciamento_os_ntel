import 'dart:io';

import 'package:gerenciamento_os_ntel/services/DataServiceHelper.dart';
import 'package:gerenciamento_os_ntel/services/DataUserHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class  DatabaseHelper{
  static DatabaseHelper _databaseHelper;
  Database db;
  String databaseName = 'ntelgos';

  DatabaseHelper._createInstance();
  factory DatabaseHelper() {
      if (_databaseHelper == null) {
          _databaseHelper = DatabaseHelper._createInstance();
      }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (this.db == null) {
        this.db = await inicializeDatabase();
    }
  
    return this.db;
  }

  Future<Database> inicializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + databaseName;
    
    var bd = await openDatabase
    (path, version: 1,  onCreate: _newData);
    return bd;
  }

  void _newData(Database db, int version) async {
    await db.execute('CREATE TABLE ${DataServiceHelper.table}('
      '${DataServiceHelper.colId} INTEGER PRIMARY KEY AUTOINCREMENT,'
      '${DataServiceHelper.colName} TEXT,'
      '${DataServiceHelper.colAddress} TEXT,'
      '${DataServiceHelper.colObservation} TEXT,'
      '${DataServiceHelper.colPhone} TEXT,'
      '${DataServiceHelper.colService} TEXT,'
      '${DataServiceHelper.colTechnician} TEXT,'
      '${DataServiceHelper.colSituation} TEXT,'
      '${DataServiceHelper.colDate} TEXT'
    ');');

    await db.execute('CREATE TABLE ${DataUserHelper.table}('
    '${DataUserHelper.colId} INTEGER PRIMARY KEY AUTOINCREMENT,'
    '${DataUserHelper.colName} TEXT,'
    '${DataUserHelper.colLogin} TEXT);');
  }

}