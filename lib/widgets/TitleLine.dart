import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_os_ntel/util/Util.dart';

// ignore: must_be_immutable
class TitleLine extends StatefulWidget {
  String title;
  TitleLine(this.title);

  @override
  _TitleLineState createState() => _TitleLineState();
}

class _TitleLineState extends State<TitleLine> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 4,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: MyColors.PRIMARY,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          color: MyColors.WRITE,
          child: Text(
            widget.title,
            style: TextStyle(
              color: MyColors.PRIMARY,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
