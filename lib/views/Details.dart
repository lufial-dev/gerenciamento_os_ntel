import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/widgets/TitleLine.dart';

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
}
