import 'dart:convert';

import 'package:gerenciamento_os_ntel/services/DataServiceHelper.dart';
import 'package:gerenciamento_os_ntel/services/services.dart';

import '../util/Util.dart';

class ServiceModel {
  int id;
  String name;
  String address;
  String observation;
  String phone;
  String technician;
  String service;
  String situation;
  DateTime date;
  String priority;


  ServiceModel(
    {
      this.id,
      this.name,
      this.address,
      this.observation,
      this.phone,
      this.technician,
      this.service,
      this.situation,
      this.date,
      this.priority,
    }
  );

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: int.parse(json['id']),
        name: json['name'],
        address: json['address'],
        observation: json['observation'],
        phone: json['phone'],
        technician: json['technician'],
        service: json['service'],
        situation: json['situation'],
        date: DateTime.parse(json['date']),
        priority: json['priority'],
      );

  static Future<List<ServiceModel>> all() async {
    List<ServiceModel> allServices = [];
    try{
      final response = await Services.fetchArray("app.php?technician=${Auth.user.name}");
      List result = jsonDecode(response.body);
      result
          .forEach((item) async => allServices.add(ServiceModel.fromJson(item)));
    }catch(e){
      DataServiceHelper db = DataServiceHelper();
      List<Map<String, dynamic>> serviceMap = await db.getServiceMap();
      serviceMap.forEach((service) =>
        allServices.add(ServiceModel.fromMapObject(service))
      ); 
    }

    return allServices;
  }

  Future<String> updateSituation(String situation) async {
    String oldSituation = this.situation;
    final result = await Services.fetchArray("appos.php?id=${this.id}&situation=$situation");
    if(result == Messages.NOT_CONECTION)
      return  result;
    else{
      DataServiceHelper db = DataServiceHelper();
      this.situation = situation;
      db.updateService(this, this.id);
      return oldSituation;
    }
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
        if (id != null) {
            map['id'] = id;
        }
    map['name'] = this.name;
    map['address'] = this.address;
    map['observation'] = this.observation;
    map['phone'] = this.phone;
    map['technician'] = this.technician;
    map['service'] = this.service;
    map['situation'] = this.situation;
    map['date'] = this.date.toString();
    map['priority'] = this.priority;
    return map;
  }
 
  ServiceModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.address = map['address'];
    this.observation = map['observation'];
    this.phone = map['phone'];
    this.technician = map['technician'];
    this.service = map['service'];
    this.situation = map['situation'];
    this.date = DateTime.parse(map['date']);
    this.priority = map['priority'];
  }

}
