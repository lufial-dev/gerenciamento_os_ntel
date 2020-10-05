import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/services/DataBaseHelper.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/views/Details.dart';
import 'package:gerenciamento_os_ntel/views/Login.dart';
import 'package:gerenciamento_os_ntel/widgets/ServiceCard.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<Home> {
  List<Widget> childrens = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    childrens = [];
    try {
      List services = await ServiceModel.all();
      setState(() {
        services.forEach((service) => childrens.add(ServiceCard(service)));
      });
    }catch (e){
       setState(() {
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
       });
    }
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
      body: RefreshIndicator(
        onRefresh: loadData,
        child: ListView.builder(
          itemCount: childrens.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                ServiceCard serviceCard = childrens[index];
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Details(serviceCard.service)));
              },
              child: childrens[index],
            );
          },
        ),
      ),
    );
  }

  _showExitDialog(){
    showDialog(
      context: context,
      child:AlertDialog(
        title: Text("Sair"),
        content: Text("Tem certexa que deseja sair?"),
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

  _exit(){
    DatabaseHelper db = DatabaseHelper();
    db.deleteUser(Auth.user.id);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (Route<dynamic> route) => false);
  }

}
