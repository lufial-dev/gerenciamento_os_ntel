import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/views/Splash.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      title: 'Ntel GOS',
      theme: ThemeData(
        primaryColor: MyColors.PRIMARY,
      ),
      home: Splash(),
    );

  }  

}
