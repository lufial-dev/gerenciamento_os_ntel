import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/views/Home.dart';

import 'views/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ntel G-OS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Ntel Telecom'),
    );
  }
}
