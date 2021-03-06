import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/models/UserModel.dart';
import 'package:gerenciamento_os_ntel/services/DataServiceHelper.dart';
import 'package:gerenciamento_os_ntel/services/DataUserHelper.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/views/Details.dart';
import 'package:gerenciamento_os_ntel/views/Login.dart';
import 'package:gerenciamento_os_ntel/widgets/ServiceCard.dart';

class Home extends StatefulWidget {
  final FirebaseMessaging _firebaseMessaging;
  final GlobalKey keyForm = GlobalKey();

  Home(this._firebaseMessaging);
  

  @override
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<Home> {
  List<Widget> childrens = [];
  DataServiceHelper db = DataServiceHelper();

  @override
  void initState() {
    super.initState();
    loadData();   
    widget._firebaseMessaging.configure(
      onMessage: (_) async {
        loadData();
      }
    );
  }

  void _addItems(service){
    db.insertService(service);
    childrens.add(ServiceCard(service));
  }

  Future<void> loadData() async {
    childrens = [];
    List services = await ServiceModel.all();
    setState(() {
      if(services.isNotEmpty){
        db.removeAll();
        services.forEach((service) => _addItems(service));
      }else 
        childrens.add(
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Center(
              child: Text("NENHUM SERVIÇO",
                style: TextStyle(
                  fontSize: MyFontSize.FULL_TITLE,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.PRIMARY,
        bottom: PreferredSize(
          child: Container(
            color: MyColors.SECONDARY,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _showExitDialog,
          ),
        ],
        title: Text("Ntel Telecom"),
      ),
      body: Form(
        key: widget.keyForm,
        child: RefreshIndicator(
          onRefresh: loadData,
          child: ListView.builder(
            itemCount: childrens.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  ServiceCard serviceCard = childrens[index];
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => 
                      Details(serviceCard.service))).then((value) => 
                        setState((){
                          loadData();
                        })
                      );
                },
                child: childrens[index],
              );
            },
          ),
        ),
      ),
    );
  }

  _showExitDialog(){
    showDialog(
      context: context,
      child:AlertDialog(
        title: Text("Sair"),
        content: Text(Messages.EXIT),
        actions: [
            FlatButton(
              onPressed: _exit,
              child: Text("Sim"),
            ),

            FlatButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Não"),
            ),
        ],
      ),
    );
  }

  _exit() async {
    DataUserHelper dbu = DataUserHelper();
    DataServiceHelper dbs = DataServiceHelper();
    UserModel user = await Auth.user.logout();
    if(user == null ){
      Scaffold.of(widget.keyForm.currentContext).showSnackBar(
        SnackBar(content: 
          Text(
            "Você não possui conexão"
          ),
        )
      );
    }else{
      dbu.removeAll();
      dbs.removeAll();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login(widget._firebaseMessaging)), (Route<dynamic> route) => false);
    }

  }

}
