import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/widgets/TitleLine.dart';

import '../util/Util.dart';

class Details extends StatefulWidget {

  final ServiceModel serviceModel;

  Details(this.serviceModel);
  
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFAB(),
      appBar: AppBar(
        backgroundColor: MyColors.PRIMARY,
        bottom: PreferredSize(
          child: Container(
            color: MyColors.SECONDARY,
            height: 4.0,
          ),
          preferredSize: Size.fromHeight(4.0),
        ),
        title: Text("Detalhes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TitleLine("Dados do Cliente"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Nome: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.serviceModel.name),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Endereço: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.serviceModel.address),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Telefone: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.serviceModel.phone),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: TitleLine("Dados da Os"),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Tipo: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.serviceModel.service),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Observação: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 5),
                    child: Text(widget.serviceModel.observation),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Situação: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.serviceModel.situation),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: MyColors.SECONDARY,
      visible: true,
      curve: Curves.bounceIn,
      children: [
            
            SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: MyColors.SECONDARY,
            onTap: (){
              widget.serviceModel.updateSituation("SEM CONTATO");
            },
            label: 'SEM CONTATO',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: MyColors.SECONDARY),
            
            SpeedDialChild(
            child: Icon(Icons.assignment_turned_in),
            backgroundColor: MyColors.PRIMARY,
            onTap:(){
              widget.serviceModel.updateSituation("FEITO");
            },
            label: 'FEITO',
            labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 16.0),
            labelBackgroundColor: MyColors.PRIMARY)
      ],
    );
  }

}
