import 'dart:convert';

import 'package:gerenciamento_os_ntel/services/services.dart';

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

  ServiceModel(
      {this.id,
      this.name,
      this.address,
      this.observation,
      this.phone,
      this.technician,
      this.service,
      this.situation,
      this.date});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        observation: json['observation'],
        phone: json['phone'],
        technician: json['technician'],
        service: json['service'],
        situation: json['siituation'],
        date: DateTime.parse(json['date']),
      );

  static Future<List<ServiceModel>> all() async {
    final response = await Services.fetchArray("app.php");
    List<ServiceModel> allServices = [];
    List result = jsonDecode(response.body);

    result
        .forEach((item) async => allServices.add(ServiceModel.fromJson(item)));

    return allServices;
  }
}