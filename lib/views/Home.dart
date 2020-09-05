import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Details()));
            },
            child: ServiceCard(),
          );
        },
      ),
    );
  }
}
