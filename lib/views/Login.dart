import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/services/DataBaseHelper.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/views/Home.dart';

import '../models/UserModel.dart';
import '../util/Util.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _login;
  String _pass;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
  
    return Scaffold(
      backgroundColor: MyColors.PRIMARY,
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                padding: EdgeInsets.only(
                  top: height * 0.15,
                  bottom: height * 0.13,
                ),
                child: Container(
                  margin:EdgeInsets.symmetric(horizontal:  width * 0.1),
                  padding:EdgeInsets.symmetric(horizontal:  width * 0.1),
                  decoration: BoxDecoration(
                    color: MyColors.WRITE,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: 
                  Form(
                    key: _formKey,
                    child:Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child:Image.asset(
                            "assets/logo.png",
                            width: width * 0.5,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: height*0.02), 
                          child: TextFormField(
                            validator: _validator,
                            onChanged: _savedLogin,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'Usuário',
                            ),
                          ),
                        ),
                          
                        Container(
                          margin: EdgeInsets.symmetric(vertical: height*0.02), 
                          child: TextFormField(
                            obscureText: true,
                            validator: _validator,
                            onChanged: _savedPass,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: 'Senha',
                            ),
                          ),
                        ),


                        FlatButton(
                          onPressed: _subimit,
                          padding: EdgeInsets.all(0),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: height*0.02), 
                            width: width,
                            height: 40,
                            child: Center(
                              child:Text(
                                "ENTRAR",
                                style: TextStyle(
                                  color: MyColors.WRITE,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: MyColors.SECONDARY,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              Text(
                "Powered by Filipe & Ramon",
                style: TextStyle(
                  fontSize: MyFontSize.FOOTER,
                  color: MyColors.WRITE
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  String _validator(String value){
    if(value.isEmpty)
      return 'Preencha este campo';
    
  }

  _savedLogin(String value){
    _login = value.trim();
  }

  _savedPass(String value){
    _pass = value.trim();
  }

  _subimit() async {
    if(_formKey.currentState.validate()){
      UserModel user = await UserModel.authentication(login: _login, password: _pass);
      if(user.name == null)
        _showSnack("Usuário ou senha incorretos");
      else{
        try{
          DatabaseHelper databaseHelper = DatabaseHelper();
          databaseHelper.insertUser(user);
          Auth.user = user;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }catch(e){
          _showSnack("Erro de acesso ao banco de dados, entre em contado com o desenvolvimento");
        }
      }
    }
  }

  _showSnack(String msg){
    Scaffold.of(_formKey.currentContext)
    .showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(
            color: MyColors.SECONDARY,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: MyColors.WRITE,
      ),
    );
  }
}