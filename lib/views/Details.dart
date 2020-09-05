import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';
import 'package:gerenciamento_os_ntel/widgets/TitleLine.dart';

class Details extends StatefulWidget {
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
                  Text("Luiz Filipe Alves da Silva"),
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
                  Text("Rua José Alencar de Carvalho Pires"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    "Número: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("19"),
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
                  Text("(87) 9 9611-6866"),
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
                  Text("(87) 9 9611-6866"),
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
                    "Manutenção: ",
                    style: TextStyle(
                      color: MyColors.TITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 5),
                    child: Text("Cliente informa que o caminhão torou a fibra"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
