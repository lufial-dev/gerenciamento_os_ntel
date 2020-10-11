
import 'package:gerenciamento_os_ntel/services/DataBaseHelper.dart';
import 'package:sqflite/sqflite.dart';

import '../models/ServiceModel.dart';

class DataServiceHelper {

  static String table = 'table_service';
  static String colId = 'id';
  static String colName = 'name';
  static String colAddress = 'address';
  static String colObservation = 'observation';
  static String colPhone = 'phone';
  static String colTechnician = 'technician';
  static String colService = 'service';
  static String colSituation = 'situation';
  static String colDate = 'date';
  static String colPriority = 'priority';

  DatabaseHelper database = DatabaseHelper();


  

  Future<List<Map<String, dynamic>>> getServiceMap() async => 
    await database.inicializeDatabase().then((value) async{
      Database db = await database.database;
      DateTime now = DateTime.now();
      DateTime date = DateTime(now.year, now.month, now.day);
      var result = await db.rawQuery("SELECT * FROM $table WHERE date BETWEEN '${date.toString()}' AND '${date.toString()}' ORDER BY priority ASC, id DESC");
      return result;
    });

  Future<int> insertService(ServiceModel service) async {
    Database db = await database.database;
    var result = await db.insert(table, service.toMap());
  return result;
  }

  Future<int> updateService(ServiceModel service,int id) async {
    var db = await database.database;
    var result = await db.rawUpdate(
      "UPDATE $table SET "
      "$colName = '${service.name}', "
      "$colAddress = '${service.address}', "
      "$colObservation = '${service.observation}', "
      "$colPhone = '${service.phone}', "
      "$colTechnician = '${service.technician}', "
      "$colService = '${service.service}', "
      "$colSituation = '${service.situation}', "
      "$colDate = '${service.date.toString()}', "
      "$colPriority = '${service.priority}' "
      "WHERE $colId = '$id' ");
    return result;
  }
  
  Future<int> deleteService(int id) async {
    var db = await database.database;
    int result = await db.rawDelete('DELETE FROM $table WHERE $colId = $id');
    return result;
  }

  Future<int> removeAll() async {
    var db = await database.database;
    int result = await db.rawDelete('DELETE FROM $table');
    return result;
  }

  

}