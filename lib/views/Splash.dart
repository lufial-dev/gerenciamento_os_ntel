import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/services/DataUserHelper.dart';
import 'package:gerenciamento_os_ntel/views/Login.dart';

import '../models/UserModel.dart';
import '../util/Util.dart';
import 'Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    
    return _introScreen();
  }

  @override
  void initState() {
    super.initState();
    _getUser();

  }

  _getUser() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

    DataUserHelper db = DataUserHelper();
    List<Map<String, dynamic>> userMap = await db.getUserMap();

    Future.delayed(Duration(seconds: 5)).then((_){
      if(userMap[0].isNotEmpty){
        Auth.user = UserModel.fromMapObject(userMap[0]);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(_firebaseMessaging)));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(_firebaseMessaging)));
      }
    }).catchError((e){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(_firebaseMessaging)));
    });
  }
}

Widget _introScreen() {
  return Container(
    color: MyColors.PRIMARY,
    child:Column(
      children: [
        Expanded(
          child:Container(
            height: 150,
            
            decoration: BoxDecoration(
              color: MyColors.WRITE,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(left: 20, right: 20, top: 150),
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                child: new Container(
                  decoration: new BoxDecoration(color: MyColors.WRITE.withOpacity(0.0)),
                  child: Image.asset("assets/logo.png"),
                ),
            ),    
          ),
        ),
        Expanded(
          child: Center(child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(MyColors.SECONDARY),
          ),)
        )
      ],
    ),
  );

  
}

