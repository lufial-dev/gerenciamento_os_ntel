import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_os_ntel/models/ServiceModel.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  ServiceCard(this.service);

  @override
  Widget build(BuildContext context) {
    print(service.situation);
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
                            this.service.name,
                            style: TextStyle(
                              color: MyColors.TITLE,
                              fontSize: MyFontSize.TITLE,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          this.service.address,
                          style: TextStyle(
                            color: MyColors.TEXT,
                            fontSize: MyFontSize.SUBTITLE,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: MyIcons.getIcon[service.situation],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    this.service.service,
                    style: TextStyle(
                      color: MyColors.SECONDARY,
                      fontSize: MyFontSize.SUBTITLE,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  formatDate(this.service.date, [dd, '/', mm, '/', yyyy]),
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
