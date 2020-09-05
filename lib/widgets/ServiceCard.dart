import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';

class ServiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Luiz Filipe Alves da Silva",
                            style: TextStyle(
                              color: MyColors.TITLE,
                              fontSize: MyFontSize.TITLE,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          "Rua José Alencar de Carvalho Pires, 19, Centro",
                          style: TextStyle(
                            color: MyColors.TEXT,
                            fontSize: MyFontSize.SUBTITLE,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 3),
                          child: Text(
                            "Do lado da Assistencia Social",
                            style: TextStyle(
                              color: MyColors.TEXT,
                              fontSize: MyFontSize.SUBTITLE,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: MyIcons.SUCCESS,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Fibra Torada",
                    style: TextStyle(
                      color: MyColors.SECONDARY,
                      fontSize: MyFontSize.SUBTITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "20/12/2020 10:00",
                  style: TextStyle(
                    color: MyColors.TEXT,
                    fontSize: MyFontSize.SUBTITLE,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
