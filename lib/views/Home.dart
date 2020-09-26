import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/views/Details.dart';
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
        actions: <Widget>[Icon(Icons.search)],
        title: Text("Ntel Telecom"),
      ),
      drawer: Drawer(),
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
}
